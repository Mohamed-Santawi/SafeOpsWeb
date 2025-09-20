using AuthServer.CustomException;
using AuthServer.Data;
using AuthServer.Entity;
using AuthServer.Models;
using AuthShared.DTOs;
using AuthShared.Enums;
using AuthShared.Models;
using Microsoft.EntityFrameworkCore;
using System.Text;

namespace AuthServer.Procedures
{
    public class TraineeProcedures
    {
        #region Fields

        ApplicationDbContext _context;
        AppUserDataContext _appUserDataContext;

        #endregion

        #region Constructor

        public TraineeProcedures(ApplicationDbContext context,
            AppUserDataContext appUserDataContext)
        {
            _context = context;
            _appUserDataContext = appUserDataContext;
        }

        #endregion

        #region Methods

        //get all trainees from the database
        public async Task<TraineeBatch> GetAllTrainees(int current,int max)
        {

            if(current <= 0 || max <= 0)
            {
                throw new InvaildBatchValueException();
            }

            var trainees = await _context.Trainee
                .Skip((current - 1) * max)
                .Take(max)
                .ToListAsync();

            var hasNext = _context.Trainee
                .Skip(current * max)
                .Any();



    



            List<TraineeShared> traineesShared = new List<TraineeShared>();

            foreach (var trainee in trainees)
            {
                var major =  _context.TraineeMajor.Where(tm => tm.Id == trainee.Major).FirstOrDefault();

                traineesShared.Add(new TraineeShared()
                {
                    Id = trainee.Id,
                    Name = trainee.Name,
                    NationalId = trainee.NationalId,
                    AcademyId = trainee.AcademyId,
                    MajorId = trainee.Major,
                    Major = major.Name,
                    Email = trainee.Email,
                    Phone = trainee.Phone,
                    Address = trainee.Address,
                    City = trainee.City,
                    State = trainee.State,
                    Zip = trainee.Zip,
                    BehaviorScore = trainee.BehaviorScore,
                    ProfileImage = trainee.ProfileImage
                });
            }

            if(traineesShared.Count == 0 || traineesShared is null)
            {
                throw new NoTrainnesFoundException("No trainees found");
            }

            var traineeBatchShared = new TraineeBatch()
            {
                Trainees = traineesShared,
                HasNext = hasNext
            };

            return traineeBatchShared;
        }

        //get all trainees count
        public async Task<int> GetAllTraineesCount()
        {
            return await _context.Trainee.CountAsync();
        }


        //update a trainee
        public async Task<bool> UpdateTrainee(TraineeShared traineeShared)
        {
            TraineeEntity trainee = await _context.Trainee.FirstOrDefaultAsync(t => t.Id == traineeShared.Id);

            if (trainee is null)
            {
                throw new NoTrainnesFoundException("Trainee not found");
            }


            //trainee info
            trainee.Name = traineeShared.Name;
            trainee.NationalId = traineeShared.NationalId;
            trainee.Major = traineeShared.MajorId;
            trainee.Email = traineeShared.Email;
            trainee.Phone = traineeShared.Phone;
            trainee.Address = traineeShared.Address;
            trainee.City = traineeShared.City;
            trainee.State = traineeShared.State;
            trainee.Zip = traineeShared.Zip;
            trainee.BehaviorScore = traineeShared.BehaviorScore;
            if(!string.IsNullOrEmpty(traineeShared.ProfileImage))
            trainee.ProfileImage = traineeShared.ProfileImage;

            //update the trainee
            _context.Trainee.Update(trainee);
            //save the update on the database
            int result = await _context.SaveChangesAsync();

            if (result == 0)
            {
                throw new TraineeNotUpdatedException("Trainee not updated");
            }
            else
            {
                return true;
            }
        }

        public async Task<TraineeShared> GetTraineeById(int id)
        {
            var trainee = await _context.Trainee.FirstOrDefaultAsync(t => t.Id == id);

            if (trainee is null)
            {
                throw new NoTrainnesFoundException("Trainee not found");
            }


            var major = _context.TraineeMajor.Where(tm => tm.Id == trainee.Major).FirstOrDefault();



            var traineeShared = new TraineeShared()
            {
                Id = trainee.Id,
                Name = trainee.Name,
                NationalId = trainee.NationalId,
                AcademyId = trainee.AcademyId,
                MajorId = trainee.Major,
                Major = major.Name,
                Email = trainee.Email,
                Phone = trainee.Phone,
                Address = trainee.Address,
                City = trainee.City,
                State = trainee.State,
                Zip = trainee.Zip,
                BehaviorScore = trainee.BehaviorScore,
                ProfileImage = trainee.ProfileImage
            };
            return traineeShared;
        }

        //get by name
        public async Task<TraineeBatch> GetTraineeByName(string name,int current,int max)
        {

            if(current <= 0 || max <= 0)
            {
                throw new InvaildBatchValueException();
            }

            var trainees = await _context.Trainee.Where(t => t.Name.Contains(name))
                .Skip((current - 1) * max)
                .Take(max)
                .ToListAsync();

            bool hasNext = _context.Trainee.Where(t => t.Name.Contains(name))
                .Skip(Convert.ToInt32(current * max))
                .Any();


           

            List<TraineeShared> traineeShareds = new List<TraineeShared>();

            foreach (var trainee in trainees)
            {
                var major = _context.TraineeMajor.Where(tm => tm.Id == trainee.Major).FirstOrDefault();
                traineeShareds.Add(new TraineeShared()
                {
                    Id = trainee.Id,
                    Name = trainee.Name,
                    NationalId = trainee.NationalId,
                    AcademyId = trainee.AcademyId,
                    MajorId = trainee.Major,
                    Major = major.Name,
                    Email = trainee.Email,
                    Phone = trainee.Phone,
                    Address = trainee.Address,
                    City = trainee.City,
                    State = trainee.State,
                    Zip = trainee.Zip,
                    BehaviorScore = trainee.BehaviorScore,
                    ProfileImage = trainee.ProfileImage
                });
            }


            TraineeBatch traineeBatch = new()
            {
                Trainees = traineeShareds,
                HasNext = hasNext
            };



            if (trainees is null || trainees.Count <= 0)
            {
                throw new NoTrainnesFoundException("Trainee not found");
            }


            List<TraineeShared> traineesShared = new List<TraineeShared>();

            //major

            foreach (var trainee in trainees)
            {

                var major = _context.TraineeMajor.Where(tm => tm.Id == trainee.Major).FirstOrDefault();

                traineesShared.Add(new TraineeShared()
                {
                    Id = trainee.Id,
                    Name = trainee.Name,
                    NationalId = trainee.NationalId,
                    AcademyId = trainee.AcademyId,
                    MajorId = trainee.Major,
                    Major = major.Name,
                    Email = trainee.Email,
                    Phone = trainee.Phone,
                    Address = trainee.Address,
                    City = trainee.City,
                    State = trainee.State,
                    Zip = trainee.Zip,
                    BehaviorScore = trainee.BehaviorScore,
                    ProfileImage = trainee.ProfileImage
                });

            }



            return traineeBatch;
        }


        //delete by id 
        public async Task<bool> DeleteTrainee(int id)
        {
            var trainee = await _context.Trainee.FirstOrDefaultAsync(t => t.Id == id);
            if (trainee is null)
            {
                throw new NoTrainnesFoundException("Trainee not found");
            }
            _context.Trainee.Remove(trainee);
            int result = await _context.SaveChangesAsync();
            if (result == 0)
            {
                throw new TraineeNotDeletedException("Trainee not deleted");
            }
            else
            {
                return true;
            }
        }

        //get by national id
        public async Task<TraineeShared> GetTraineeByNationalId(int nationalId)
        {
            var trainee = await _context.Trainee.FirstOrDefaultAsync(t => t.NationalId == nationalId);

            if (trainee is null)
            {
                throw new NoTrainnesFoundException("Trainee not found");
            }

            var major = _context.TraineeMajor.Where(tm => tm.Id == trainee.Major).FirstOrDefault();


            TraineeShared traineeShared = new TraineeShared()
            {
                Id = trainee.Id,
                Name = trainee.Name,
                NationalId = trainee.NationalId,
                AcademyId = trainee.AcademyId,
                MajorId = trainee.Major,
                Major = major.Name,
                Email = trainee.Email,
                Phone = trainee.Phone,
                Address = trainee.Address,
                City = trainee.City,
                State = trainee.State,
                Zip = trainee.Zip,
                BehaviorScore = trainee.BehaviorScore,
                ProfileImage = trainee.ProfileImage
            };



            return traineeShared;
        }

        //add a new trainee via TraineeShared object
        public async Task<bool> AddTrainee(TraineeShared traineeShared)
        {
            TraineeEntity trainee = new TraineeEntity()
            {
                Name = traineeShared.Name,
                NationalId = traineeShared.NationalId,
                AcademyId = traineeShared.AcademyId,
                Major = traineeShared.MajorId,
                Email = traineeShared.Email,
                Phone = traineeShared.Phone,
                Address = traineeShared.Address,
                City = traineeShared.City,
                State = traineeShared.State,
                Zip = traineeShared.Zip,
                BehaviorScore = traineeShared.BehaviorScore,
                ProfileImage = traineeShared.ProfileImage
            };
            _context.Trainee.Add(trainee);
            int result = await _context.SaveChangesAsync();

            if (result == 0)
            {
                throw new TraineeNotAddedException("Trainee not added");
            }
            else
            {
                return true;
            }
        }
        #endregion
    }
}
