; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [366 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [726 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 272
	i64 98382396393917666, ; 1: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 216
	i64 120698629574877762, ; 2: Mono.Android => 0x1accec39cafe242 => 172
	i64 131669012237370309, ; 3: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 222
	i64 196720943101637631, ; 4: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 59
	i64 210515253464952879, ; 5: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 259
	i64 229794953483747371, ; 6: System.ValueTuple.dll => 0x330654aed93802b => 152
	i64 232391251801502327, ; 7: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 300
	i64 295915112840604065, ; 8: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 303
	i64 316157742385208084, ; 9: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 266
	i64 350667413455104241, ; 10: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 133
	i64 395901413406438404, ; 11: Syncfusion.Blazor.Spinner.dll => 0x57e863ce82a7404 => 237
	i64 422779754995088667, ; 12: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 57
	i64 435118502366263740, ; 13: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 302
	i64 545109961164950392, ; 14: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 334
	i64 560278790331054453, ; 15: System.Reflection.Primitives => 0x7c6829760de3975 => 96
	i64 634308326490598313, ; 16: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 285
	i64 648449422406355874, ; 17: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x8ffc15065568ba2 => 199
	i64 649145001856603771, ; 18: System.Security.SecureString => 0x90239f09b62167b => 130
	i64 666970978597137937, ; 19: Syncfusion.Blazor.Core => 0x9418e923ec6ee11 => 227
	i64 668723562677762733, ; 20: Microsoft.Extensions.Configuration.Binder.dll => 0x947c88986577aad => 198
	i64 683390398661839228, ; 21: Microsoft.Extensions.FileProviders.Embedded => 0x97be3f26326c97c => 205
	i64 750875890346172408, ; 22: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 146
	i64 798450721097591769, ; 23: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 260
	i64 799765834175365804, ; 24: System.ComponentModel.dll => 0xb1956c9f18442ac => 20
	i64 849051935479314978, ; 25: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 337
	i64 872800313462103108, ; 26: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 271
	i64 895210737996778430, ; 27: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 286
	i64 940822596282819491, ; 28: System.Transactions => 0xd0e792aa81923a3 => 151
	i64 960778385402502048, ; 29: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 105
	i64 1010599046655515943, ; 30: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 96
	i64 1073802724419667368, ; 31: Syncfusion.Blazor.SplitButtons => 0xee6e9e37be185a8 => 238
	i64 1120440138749646132, ; 32: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 315
	i64 1121665720830085036, ; 33: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 345
	i64 1268860745194512059, ; 34: System.Drawing.dll => 0x119be62002c19ebb => 37
	i64 1301626418029409250, ; 35: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 29
	i64 1315114680217950157, ; 36: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 255
	i64 1369545283391376210, ; 37: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 293
	i64 1404195534211153682, ; 38: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 51
	i64 1425218169901403020, ; 39: ar/AuthShared.resources.dll => 0x13c7645fd867cb8c => 0
	i64 1425944114962822056, ; 40: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 116
	i64 1476839205573959279, ; 41: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 71
	i64 1486715745332614827, ; 42: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 219
	i64 1492954217099365037, ; 43: System.Net.HttpListener => 0x14b809f350210aad => 66
	i64 1513467482682125403, ; 44: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 171
	i64 1537168428375924959, ; 45: System.Threading.Thread.dll => 0x15551e8a954ae0df => 146
	i64 1556147632182429976, ; 46: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 343
	i64 1576750169145655260, ; 47: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 314
	i64 1624659445732251991, ; 48: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 254
	i64 1628611045998245443, ; 49: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 289
	i64 1636321030536304333, ; 50: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 279
	i64 1639340239664632727, ; 51: Microsoft.AspNetCore.Cryptography.Internal.dll => 0x16c01b432b36d397 => 186
	i64 1651782184287836205, ; 52: System.Globalization.Calendars => 0x16ec4f2524cb982d => 41
	i64 1659332977923810219, ; 53: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 90
	i64 1682513316613008342, ; 54: System.Net.dll => 0x17597cf276952bd6 => 82
	i64 1686520669085146360, ; 55: Syncfusion.Blazor.Inputs => 0x1767b99ceb2c9cf8 => 232
	i64 1735388228521408345, ; 56: System.Net.Mail.dll => 0x181556663c69b759 => 67
	i64 1743969030606105336, ; 57: System.Memory.dll => 0x1833d297e88f2af8 => 63
	i64 1767386781656293639, ; 58: System.Private.Uri.dll => 0x188704e9f5582107 => 87
	i64 1776954265264967804, ; 59: Microsoft.JSInterop.dll => 0x18a9027d533bd07c => 217
	i64 1795316252682057001, ; 60: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 253
	i64 1825687700144851180, ; 61: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 107
	i64 1835311033149317475, ; 62: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 333
	i64 1836611346387731153, ; 63: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 300
	i64 1854145951182283680, ; 64: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 103
	i64 1875417405349196092, ; 65: System.Drawing.Primitives => 0x1a06d2319b6c713c => 36
	i64 1875917498431009007, ; 66: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 250
	i64 1881198190668717030, ; 67: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 355
	i64 1897575647115118287, ; 68: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 302
	i64 1920760634179481754, ; 69: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 220
	i64 1959996714666907089, ; 70: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 355
	i64 1972385128188460614, ; 71: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 120
	i64 1981742497975770890, ; 72: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 287
	i64 1983698669889758782, ; 73: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 329
	i64 2019660174692588140, ; 74: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 347
	i64 2040001226662520565, ; 75: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 143
	i64 2062890601515140263, ; 76: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 142
	i64 2064708342624596306, ; 77: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 323
	i64 2080945842184875448, ; 78: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 54
	i64 2102659300918482391, ; 79: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 36
	i64 2106033277907880740, ; 80: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 142
	i64 2165310824878145998, ; 81: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 247
	i64 2165725771938924357, ; 82: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 257
	i64 2192948757939169934, ; 83: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 192
	i64 2200176636225660136, ; 84: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 214
	i64 2238931149034055110, ; 85: Syncfusion.Blazor.Grids.dll => 0x1f12480486bb65c6 => 231
	i64 2262844636196693701, ; 86: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 271
	i64 2287834202362508563, ; 87: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 10
	i64 2287887973817120656, ; 88: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 16
	i64 2295368378960711535, ; 89: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x1fdac961189e0f6f => 185
	i64 2302323944321350744, ; 90: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 351
	i64 2304837677853103545, ; 91: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 299
	i64 2315304989185124968, ; 92: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 52
	i64 2329709569556905518, ; 93: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 282
	i64 2335503487726329082, ; 94: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 137
	i64 2337758774805907496, ; 95: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 102
	i64 2470498323731680442, ; 96: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 264
	i64 2479423007379663237, ; 97: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 309
	i64 2497223385847772520, ; 98: System.Runtime => 0x22a7eb7046413568 => 117
	i64 2547086958574651984, ; 99: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 248
	i64 2592350477072141967, ; 100: System.Xml.dll => 0x23f9e10627330e8f => 164
	i64 2602673633151553063, ; 101: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 354
	i64 2606170708597053130, ; 102: Microsoft.AspNetCore.Identity.EntityFrameworkCore => 0x242afa738df496ca => 189
	i64 2624866290265602282, ; 103: mscorlib.dll => 0x246d65fbde2db8ea => 167
	i64 2632269733008246987, ; 104: System.Net.NameResolution => 0x2487b36034f808cb => 68
	i64 2656907746661064104, ; 105: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 201
	i64 2662981627730767622, ; 106: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 329
	i64 2706075432581334785, ; 107: System.Net.WebSockets => 0x258de944be6c0701 => 81
	i64 2781169761569919449, ; 108: Microsoft.JSInterop => 0x2698b329b26ed1d9 => 217
	i64 2783046991838674048, ; 109: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 102
	i64 2787234703088983483, ; 110: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 304
	i64 2815524396660695947, ; 111: System.Security.AccessControl => 0x2712c0857f68238b => 118
	i64 2895129759130297543, ; 112: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 334
	i64 2923871038697555247, ; 113: Jsr305Binding => 0x2893ad37e69ec52f => 316
	i64 3017136373564924869, ; 114: System.Net.WebProxy => 0x29df058bd93f63c5 => 79
	i64 3017704767998173186, ; 115: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 315
	i64 3036428435510649410, ; 116: Syncfusion.Blazor.Lists => 0x2a238f930c81e242 => 233
	i64 3106852385031680087, ; 117: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 115
	i64 3110390492489056344, ; 118: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 122
	i64 3135773902340015556, ; 119: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 49
	i64 3266690593535380875, ; 120: Microsoft.AspNetCore.Authorization => 0x2d559dc982c94d8b => 178
	i64 3281594302220646930, ; 121: System.Security.Principal => 0x2d8a90a198ceba12 => 129
	i64 3289520064315143713, ; 122: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 280
	i64 3303437397778967116, ; 123: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 251
	i64 3311221304742556517, ; 124: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 83
	i64 3325875462027654285, ; 125: System.Runtime.Numerics => 0x2e27e21c8958b48d => 111
	i64 3328853167529574890, ; 126: System.Net.Sockets.dll => 0x2e327651a008c1ea => 76
	i64 3344514922410554693, ; 127: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 326
	i64 3393159929287908710, ; 128: Blazored.Typeahead => 0x2f16ecfa5b4b9d66 => 174
	i64 3396143930648122816, ; 129: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 203
	i64 3429672777697402584, ; 130: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 222
	i64 3437845325506641314, ; 131: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 54
	i64 3493805808809882663, ; 132: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 306
	i64 3494946837667399002, ; 133: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 196
	i64 3508450208084372758, ; 134: System.Net.Ping => 0x30b084e02d03ad16 => 70
	i64 3522470458906976663, ; 135: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 305
	i64 3523004241079211829, ; 136: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 195
	i64 3531994851595924923, ; 137: System.Numerics => 0x31042a9aade235bb => 84
	i64 3551103847008531295, ; 138: System.Private.CoreLib.dll => 0x31480e226177735f => 173
	i64 3567343442040498961, ; 139: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 349
	i64 3571415421602489686, ; 140: System.Runtime.dll => 0x319037675df7e556 => 117
	i64 3638003163729360188, ; 141: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 197
	i64 3647754201059316852, ; 142: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 157
	i64 3655542548057982301, ; 143: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 196
	i64 3659371656528649588, ; 144: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 245
	i64 3716579019761409177, ; 145: netstandard.dll => 0x3393f0ed5c8c5c99 => 168
	i64 3727469159507183293, ; 146: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 298
	i64 3753897248517198740, ; 147: Microsoft.AspNetCore.Components.WebView.dll => 0x341885a8952f1394 => 184
	i64 3772598417116884899, ; 148: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 272
	i64 3794322307918838949, ; 149: Microsoft.AspNetCore.Metadata.dll => 0x34a824092ed7bca5 => 190
	i64 3869221888984012293, ; 150: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 212
	i64 3869649043256705283, ; 151: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 33
	i64 3889433610606858880, ; 152: Microsoft.Extensions.FileProviders.Physical.dll => 0x35fa0b4301afd280 => 206
	i64 3890352374528606784, ; 153: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 220
	i64 3919223565570527920, ; 154: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 123
	i64 3933965368022646939, ; 155: System.Net.Requests => 0x369840a8bfadc09b => 73
	i64 3956626214857587819, ; 156: Syncfusion.ExcelExport.Net => 0x36e8c2944d95bc6b => 240
	i64 3966267475168208030, ; 157: System.Memory => 0x370b03412596249e => 63
	i64 4006972109285359177, ; 158: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 162
	i64 4009997192427317104, ; 159: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 114
	i64 4073500526318903918, ; 160: System.Private.Xml.dll => 0x3887fb25779ae26e => 89
	i64 4073631083018132676, ; 161: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 218
	i64 4120493066591692148, ; 162: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 360
	i64 4148881117810174540, ; 163: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 106
	i64 4154383907710350974, ; 164: System.ComponentModel => 0x39a7562737acb67e => 20
	i64 4167269041631776580, ; 165: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 147
	i64 4168469861834746866, ; 166: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 119
	i64 4187479170553454871, ; 167: System.Linq.Expressions => 0x3a1cea1e912fa117 => 59
	i64 4201423742386704971, ; 168: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 266
	i64 4205801962323029395, ; 169: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 19
	i64 4235503420553921860, ; 170: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 53
	i64 4282138915307457788, ; 171: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 93
	i64 4356591372459378815, ; 172: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 357
	i64 4373617458794931033, ; 173: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 56
	i64 4384840217421645357, ; 174: Microsoft.AspNetCore.Components.Forms => 0x3cda14f22443862d => 181
	i64 4397634830160618470, ; 175: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 130
	i64 4477672992252076438, ; 176: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 153
	i64 4484706122338676047, ; 177: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 42
	i64 4513320955448359355, ; 178: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 193
	i64 4533124835995628778, ; 179: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 93
	i64 4612482779465751747, ; 180: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 192
	i64 4636684751163556186, ; 181: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 310
	i64 4659385769810716620, ; 182: Microsoft.AspNetCore.Identity.EntityFrameworkCore.dll => 0x40a976abd113e7cc => 189
	i64 4672453897036726049, ; 183: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 51
	i64 4679594760078841447, ; 184: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 327
	i64 4716677666592453464, ; 185: System.Xml.XmlSerializer => 0x417501590542f358 => 163
	i64 4743821336939966868, ; 186: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 15
	i64 4759461199762736555, ; 187: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 284
	i64 4775844004932346363, ; 188: Syncfusion.Blazor.Data.dll => 0x424734d1a8abe1fb => 228
	i64 4794310189461587505, ; 189: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 248
	i64 4795410492532947900, ; 190: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 305
	i64 4809057822547766521, ; 191: System.Drawing => 0x42bd349c3145ecf9 => 37
	i64 4814660307502931973, ; 192: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 68
	i64 4853321196694829351, ; 193: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 110
	i64 5055365687667823624, ; 194: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 249
	i64 5081566143765835342, ; 195: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 100
	i64 5099468265966638712, ; 196: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 100
	i64 5103417709280584325, ; 197: System.Collections.Specialized => 0x46d2fb5e161b6285 => 13
	i64 5182934613077526976, ; 198: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 13
	i64 5197073077358930460, ; 199: Microsoft.AspNetCore.Components.Web.dll => 0x481fb66db7b9aa1c => 183
	i64 5205316157927637098, ; 200: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 291
	i64 5212680583336100981, ; 201: Syncfusion.Blazor.Core.dll => 0x4857295f61530475 => 227
	i64 5244375036463807528, ; 202: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 27
	i64 5262971552273843408, ; 203: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 129
	i64 5278787618751394462, ; 204: System.Net.WebClient.dll => 0x4942055efc68329e => 77
	i64 5280980186044710147, ; 205: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 283
	i64 5290786973231294105, ; 206: System.Runtime.Loader => 0x496ca6b869b72699 => 110
	i64 5376510917114486089, ; 207: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 309
	i64 5408338804355907810, ; 208: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 307
	i64 5423376490970181369, ; 209: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 107
	i64 5440320908473006344, ; 210: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 4
	i64 5446034149219586269, ; 211: System.Diagnostics.Debug => 0x4b94333452e150dd => 28
	i64 5451019430259338467, ; 212: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 262
	i64 5457765010617926378, ; 213: System.Xml.Serialization => 0x4bbde05c557002ea => 158
	i64 5471532531798518949, ; 214: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 353
	i64 5507995362134886206, ; 215: System.Core.dll => 0x4c705499688c873e => 23
	i64 5522859530602327440, ; 216: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 356
	i64 5527431512186326818, ; 217: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 50
	i64 5570799893513421663, ; 218: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 44
	i64 5573260873512690141, ; 219: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 127
	i64 5574231584441077149, ; 220: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 252
	i64 5578757951260396872, ; 221: Syncfusion.Blazor.DropDowns.dll => 0x4d6bbacc94c30d48 => 230
	i64 5591791169662171124, ; 222: System.Linq.Parallel => 0x4d9a087135e137f4 => 60
	i64 5650097808083101034, ; 223: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 120
	i64 5692067934154308417, ; 224: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 312
	i64 5724799082821825042, ; 225: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 275
	i64 5741990095351817038, ; 226: Microsoft.Extensions.Localization.Abstractions.dll => 0x4fafa591c141a34e => 211
	i64 5757522595884336624, ; 227: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 261
	i64 5783556987928984683, ; 228: Microsoft.VisualBasic => 0x504352701bbc3c6b => 5
	i64 5896680224035167651, ; 229: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 281
	i64 5959344983920014087, ; 230: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 301
	i64 5969543091560158368, ; 231: Syncfusion.Blazor.Lists.dll => 0x52d813d053d494a0 => 233
	i64 5979151488806146654, ; 232: System.Formats.Asn1 => 0x52fa3699a489d25e => 39
	i64 5984759512290286505, ; 233: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 125
	i64 6068057819846744445, ; 234: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 350
	i64 6102788177522843259, ; 235: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 301
	i64 6182525717148725503, ; 236: Microsoft.AspNetCore.Components.Authorization => 0x55ccbe62215df0ff => 180
	i64 6200764641006662125, ; 237: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 350
	i64 6203153813091785862, ; 238: Syncfusion.Blazor.Inputs.dll => 0x56160786fc721c86 => 232
	i64 6222399776351216807, ; 239: System.Text.Json.dll => 0x565a67a0ffe264a7 => 138
	i64 6251069312384999852, ; 240: System.Transactions.Local => 0x56c0426b870da1ac => 150
	i64 6278736998281604212, ; 241: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 86
	i64 6284145129771520194, ; 242: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 91
	i64 6319713645133255417, ; 243: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 285
	i64 6353551426948522752, ; 244: ar\SafeOpsBlazor.resources => 0x582c595c39716300 => 1
	i64 6357457916754632952, ; 245: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 362
	i64 6401687960814735282, ; 246: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 282
	i64 6478287442656530074, ; 247: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 338
	i64 6504860066809920875, ; 248: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 257
	i64 6548213210057960872, ; 249: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 268
	i64 6557084851308642443, ; 250: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 313
	i64 6560151584539558821, ; 251: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 215
	i64 6589202984700901502, ; 252: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 318
	i64 6591971792923354531, ; 253: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 283
	i64 6617685658146568858, ; 254: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 134
	i64 6713440830605852118, ; 255: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 97
	i64 6739853162153639747, ; 256: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 5
	i64 6743165466166707109, ; 257: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 346
	i64 6772837112740759457, ; 258: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 106
	i64 6777482997383978746, ; 259: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 349
	i64 6786606130239981554, ; 260: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 34
	i64 6798329586179154312, ; 261: System.Windows => 0x5e5884bd523ca188 => 155
	i64 6814185388980153342, ; 262: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 159
	i64 6876862101832370452, ; 263: System.Xml.Linq => 0x5f6f85a57d108914 => 156
	i64 6894844156784520562, ; 264: System.Numerics.Vectors => 0x5faf683aead1ad72 => 83
	i64 6920570528939222495, ; 265: Microsoft.AspNetCore.Components.WebView => 0x600ace3ab475a5df => 184
	i64 7011053663211085209, ; 266: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 277
	i64 7060896174307865760, ; 267: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 144
	i64 7083547580668757502, ; 268: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 88
	i64 7101497697220435230, ; 269: System.Configuration => 0x628d9687c0141d1e => 21
	i64 7103753931438454322, ; 270: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 278
	i64 7112547816752919026, ; 271: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 52
	i64 7192745174564810625, ; 272: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 247
	i64 7220009545223068405, ; 273: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 353
	i64 7270811800166795866, ; 274: System.Linq => 0x64e71ccf51a90a5a => 62
	i64 7299370801165188114, ; 275: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 55
	i64 7316205155833392065, ; 276: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 6
	i64 7338192458477945005, ; 277: System.Reflection => 0x65d67f295d0740ad => 98
	i64 7349431895026339542, ; 278: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 246
	i64 7377312882064240630, ; 279: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 19
	i64 7378473378125181690, ; 280: Syncfusion.Blazor.Calendars => 0x66659a71cfd3f2fa => 226
	i64 7488575175965059935, ; 281: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 156
	i64 7489048572193775167, ; 282: System.ObjectModel => 0x67ee71ff6b419e3f => 85
	i64 7592577537120840276, ; 283: System.Diagnostics.Process => 0x695e410af5b2aa54 => 30
	i64 7637303409920963731, ; 284: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 46
	i64 7654504624184590948, ; 285: System.Net.Http => 0x6a3a4366801b8264 => 65
	i64 7694700312542370399, ; 286: System.Net.Mail => 0x6ac9112a7e2cda5f => 67
	i64 7708790323521193081, ; 287: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 344
	i64 7714652370974252055, ; 288: System.Private.CoreLib => 0x6b0ff375198b9c17 => 173
	i64 7725404731275645577, ; 289: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 286
	i64 7735176074855944702, ; 290: Microsoft.CSharp => 0x6b58dda848e391fe => 3
	i64 7735352534559001595, ; 291: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 321
	i64 7791074099216502080, ; 292: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 48
	i64 7820441508502274321, ; 293: System.Data => 0x6c87ca1e14ff8111 => 26
	i64 7836164640616011524, ; 294: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 254
	i64 7972383140441761405, ; 295: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 194
	i64 8014722069583580780, ; 296: Microsoft.AspNetCore.Components.Forms.dll => 0x6f3a03422b034e6c => 181
	i64 8025517457475554965, ; 297: WindowsBase => 0x6f605d9b4786ce95 => 166
	i64 8031450141206250471, ; 298: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 109
	i64 8064050204834738623, ; 299: System.Collections.dll => 0x6fe942efa61731bf => 14
	i64 8083354569033831015, ; 300: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 280
	i64 8085230611270010360, ; 301: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 64
	i64 8087206902342787202, ; 302: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 242
	i64 8103644804370223335, ; 303: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 25
	i64 8113615946733131500, ; 304: System.Reflection.Extensions => 0x70995ab73cf916ec => 94
	i64 8167236081217502503, ; 305: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 169
	i64 8185542183669246576, ; 306: System.Collections => 0x7198e33f4794aa70 => 14
	i64 8187640529827139739, ; 307: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 325
	i64 8246048515196606205, ; 308: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 223
	i64 8264926008854159966, ; 309: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 30
	i64 8290740647658429042, ; 310: System.Runtime.Extensions => 0x730ea0b15c929a72 => 104
	i64 8318905602908530212, ; 311: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 16
	i64 8368701292315763008, ; 312: System.Security.Cryptography => 0x7423997c6fd56140 => 127
	i64 8398329775253868912, ; 313: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 263
	i64 8400357532724379117, ; 314: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 295
	i64 8410671156615598628, ; 315: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 92
	i64 8426919725312979251, ; 316: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 284
	i64 8442828414178614895, ; 317: Microsoft.AspNetCore.Cryptography.KeyDerivation => 0x752af3b5eeb0de6f => 187
	i64 8453144032365170736, ; 318: Microsoft.Extensions.Identity.Stores.dll => 0x754f99b5f456d030 => 209
	i64 8518412311883997971, ; 319: System.Collections.Immutable => 0x76377add7c28e313 => 11
	i64 8563666267364444763, ; 320: System.Private.Uri => 0x76d841191140ca5b => 87
	i64 8598790081731763592, ; 321: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 274
	i64 8599632406834268464, ; 322: CommunityToolkit.Maui => 0x7758081c784b4930 => 175
	i64 8601935802264776013, ; 323: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 307
	i64 8614108721271900878, ; 324: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 348
	i64 8623059219396073920, ; 325: System.Net.Quic.dll => 0x77ab42ac514299c0 => 72
	i64 8626175481042262068, ; 326: Java.Interop => 0x77b654e585b55834 => 169
	i64 8638972117149407195, ; 327: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 3
	i64 8639588376636138208, ; 328: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 294
	i64 8648495978913578441, ; 329: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 7
	i64 8677882282824630478, ; 330: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 348
	i64 8684531736582871431, ; 331: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 45
	i64 8725526185868997716, ; 332: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 242
	i64 8811753208883510690, ; 333: Syncfusion.Blazor.Themes => 0x7a49a2db57e8fda2 => 239
	i64 8853378295825400934, ; 334: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 322
	i64 8941376889969657626, ; 335: System.Xml.XDocument => 0x7c1626e87187471a => 159
	i64 8951477988056063522, ; 336: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 297
	i64 8954753533646919997, ; 337: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 113
	i64 9045785047181495996, ; 338: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 358
	i64 9111603110219107042, ; 339: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 195
	i64 9138683372487561558, ; 340: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 122
	i64 9247326888847532380, ; 341: Syncfusion.Blazor.Popups.dll => 0x80551acf9bace15c => 236
	i64 9250544137016314866, ; 342: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 191
	i64 9312692141327339315, ; 343: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 312
	i64 9324707631942237306, ; 344: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 253
	i64 9445997409726165910, ; 345: Syncfusion.Blazor.Grids => 0x8316ec98dbfcf396 => 231
	i64 9468215723722196442, ; 346: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 160
	i64 9508211702228543126, ; 347: Microsoft.AspNetCore.Cryptography.KeyDerivation.dll => 0x83f3f42aa08b6696 => 187
	i64 9541435381579787806, ; 348: Syncfusion.Blazor.Buttons.dll => 0x8469fced46682e1e => 225
	i64 9554839972845591462, ; 349: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 132
	i64 9575902398040817096, ; 350: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 317
	i64 9584643793929893533, ; 351: System.IO.dll => 0x85037ebfbbd7f69d => 58
	i64 9585349013160378720, ; 352: Syncfusion.Blazor.Calendars.dll => 0x850600246190c160 => 226
	i64 9650158550865574924, ; 353: Microsoft.Extensions.Configuration.Json => 0x85ec4012c28a7c0c => 200
	i64 9659729154652888475, ; 354: System.Text.RegularExpressions => 0x860e407c9991dd9b => 139
	i64 9662334977499516867, ; 355: System.Numerics.dll => 0x8617827802b0cfc3 => 84
	i64 9667360217193089419, ; 356: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 31
	i64 9678050649315576968, ; 357: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 264
	i64 9702891218465930390, ; 358: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 12
	i64 9780093022148426479, ; 359: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 314
	i64 9808709177481450983, ; 360: Mono.Android.dll => 0x881f890734e555e7 => 172
	i64 9825649861376906464, ; 361: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 261
	i64 9834056768316610435, ; 362: System.Transactions.dll => 0x8879968718899783 => 151
	i64 9836529246295212050, ; 363: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 95
	i64 9864374015518639636, ; 364: Microsoft.AspNetCore.Cryptography.Internal => 0x88e54be746950614 => 186
	i64 9907349773706910547, ; 365: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 274
	i64 9933555792566666578, ; 366: System.Linq.Queryable.dll => 0x89db145cf475c552 => 61
	i64 9956195530459977388, ; 367: Microsoft.Maui => 0x8a2b8315b36616ac => 221
	i64 9974604633896246661, ; 368: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 158
	i64 9991543690424095600, ; 369: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 333
	i64 10017511394021241210, ; 370: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 214
	i64 10038780035334861115, ; 371: System.Net.Http.dll => 0x8b50e941206af13b => 65
	i64 10051358222726253779, ; 372: System.Private.Xml => 0x8b7d990c97ccccd3 => 89
	i64 10078727084704864206, ; 373: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 80
	i64 10089571585547156312, ; 374: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 48
	i64 10092835686693276772, ; 375: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 219
	i64 10105485790837105934, ; 376: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 144
	i64 10143853363526200146, ; 377: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 330
	i64 10201058816038513574, ; 378: Syncfusion.Blazor.Spinner => 0x8d9170f216d7aba6 => 237
	i64 10205853378024263619, ; 379: Microsoft.Extensions.Configuration.Binder => 0x8da279930adb4fc3 => 198
	i64 10219718175678860705, ; 380: Syncfusion.PdfExport.Net.dll => 0x8dd3bb88cdf10da1 => 241
	i64 10226222362177979215, ; 381: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 323
	i64 10229024438826829339, ; 382: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 268
	i64 10236703004850800690, ; 383: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 75
	i64 10245369515835430794, ; 384: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 92
	i64 10321854143672141184, ; 385: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 320
	i64 10360651442923773544, ; 386: System.Text.Encoding => 0x8fc86d98211c1e68 => 136
	i64 10364469296367737616, ; 387: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 91
	i64 10376576884623852283, ; 388: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 306
	i64 10406448008575299332, ; 389: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 326
	i64 10430153318873392755, ; 390: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 265
	i64 10487156909445966402, ; 391: Syncfusion.Blazor.DataForm.dll => 0x9189dda5534f6a42 => 229
	i64 10506226065143327199, ; 392: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 328
	i64 10546663366131771576, ; 393: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 113
	i64 10566960649245365243, ; 394: System.Globalization.dll => 0x92a562b96dcd13fb => 43
	i64 10595762989148858956, ; 395: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 160
	i64 10670374202010151210, ; 396: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 6
	i64 10708624144129299143, ; 397: Syncfusion.ExcelExport.Net.dll => 0x949cacec1fff92c7 => 240
	i64 10714184849103829812, ; 398: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 104
	i64 10734191584620811116, ; 399: Microsoft.Extensions.FileProviders.Embedded.dll => 0x94f7825fc04f936c => 205
	i64 10785150219063592792, ; 400: System.Net.Primitives => 0x95ac8cfb68830758 => 71
	i64 10811915265162633087, ; 401: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 193
	i64 10822644899632537592, ; 402: System.Linq.Queryable => 0x9631c23204ca5ff8 => 61
	i64 10830817578243619689, ; 403: System.Formats.Tar => 0x964ecb340a447b69 => 40
	i64 10847732767863316357, ; 404: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 255
	i64 10869656460465975753, ; 405: SafeOpsBlazor.dll => 0x96d8c6f5fc9ab1c9 => 2
	i64 10880838204485145808, ; 406: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 175
	i64 10899834349646441345, ; 407: System.Web => 0x9743fd975946eb81 => 154
	i64 10943875058216066601, ; 408: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 57
	i64 10964653383833615866, ; 409: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 35
	i64 11002576679268595294, ; 410: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 213
	i64 11009005086950030778, ; 411: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 221
	i64 11016704648057174400, ; 412: Syncfusion.Blazor.DataForm => 0x98e3328226d7b980 => 229
	i64 11019817191295005410, ; 413: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 252
	i64 11023048688141570732, ; 414: System.Core => 0x98f9bc61168392ac => 23
	i64 11037814507248023548, ; 415: System.Xml => 0x992e31d0412bf7fc => 164
	i64 11050168729868392624, ; 416: Microsoft.AspNetCore.Http.Features => 0x995a15e9dbef58b0 => 188
	i64 11051904132540108364, ; 417: Microsoft.Extensions.FileProviders.Composite.dll => 0x99604040c7b98e4c => 204
	i64 11071824625609515081, ; 418: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 318
	i64 11103970607964515343, ; 419: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 339
	i64 11136029745144976707, ; 420: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 316
	i64 11162124722117608902, ; 421: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 311
	i64 11188319605227840848, ; 422: System.Threading.Overlapped => 0x9b44e5671724e550 => 141
	i64 11218356222449480316, ; 423: Microsoft.AspNetCore.Components => 0x9baf9b8c02e4f27c => 179
	i64 11220793807500858938, ; 424: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 342
	i64 11226290749488709958, ; 425: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 215
	i64 11235648312900863002, ; 426: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 90
	i64 11329751333533450475, ; 427: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 148
	i64 11340910727871153756, ; 428: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 267
	i64 11347436699239206956, ; 429: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 163
	i64 11377192284181532302, ; 430: SafeOpsBlazor => 0x9de3e81a7ff48e8e => 2
	i64 11392833485892708388, ; 431: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 296
	i64 11432101114902388181, ; 432: System.AppContext => 0x9ea6fb64e61a9dd5 => 8
	i64 11446671985764974897, ; 433: Mono.Android.Export => 0x9edabf8623efc131 => 170
	i64 11448276831755070604, ; 434: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 32
	i64 11485890710487134646, ; 435: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 108
	i64 11508496261504176197, ; 436: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 277
	i64 11513602507638267977, ; 437: System.IO.Pipelines.dll => 0x9fc8887aa0d36049 => 243
	i64 11518296021396496455, ; 438: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 340
	i64 11529969570048099689, ; 439: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 311
	i64 11530571088791430846, ; 440: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 212
	i64 11579551484078063302, ; 441: ar\AuthShared.resources => 0xa0b2d4b942d1fec6 => 0
	i64 11580057168383206117, ; 442: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 250
	i64 11591352189662810718, ; 443: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 304
	i64 11597308262950669618, ; 444: Microsoft.Extensions.Identity.Core.dll => 0xa0f1ea6b83e08d32 => 208
	i64 11597940890313164233, ; 445: netstandard => 0xa0f429ca8d1805c9 => 168
	i64 11622657603305904499, ; 446: Microsoft.Extensions.Identity.Stores => 0xa14bf982bf0a9973 => 209
	i64 11672361001936329215, ; 447: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 278
	i64 11692977985522001935, ; 448: System.Threading.Overlapped.dll => 0xa245cd869980680f => 141
	i64 11705530742807338875, ; 449: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 336
	i64 11707554492040141440, ; 450: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 60
	i64 11743665907891708234, ; 451: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 145
	i64 11991047634523762324, ; 452: System.Net => 0xa668c24ad493ae94 => 82
	i64 12040886584167504988, ; 453: System.Net.ServicePoint => 0xa719d28d8e121c5c => 75
	i64 12048689113179125827, ; 454: Microsoft.Extensions.FileProviders.Physical => 0xa7358ae968287843 => 206
	i64 12058074296353848905, ; 455: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 207
	i64 12063623837170009990, ; 456: System.Security => 0xa76a99f6ce740786 => 131
	i64 12075303808054746781, ; 457: Plugin.Maui.Audio.dll => 0xa79418d5f2065e9d => 224
	i64 12096697103934194533, ; 458: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 27
	i64 12102847907131387746, ; 459: System.Buffers => 0xa7f5f40c43256f62 => 9
	i64 12123043025855404482, ; 460: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 94
	i64 12137774235383566651, ; 461: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 308
	i64 12145679461940342714, ; 462: System.Text.Json => 0xa88e1f1ebcb62fba => 138
	i64 12180051240024769032, ; 463: Syncfusion.Blazor.DropDowns => 0xa9083c11f3bb8208 => 230
	i64 12191646537372739477, ; 464: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 244
	i64 12201331334810686224, ; 465: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 114
	i64 12269460666702402136, ; 466: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 11
	i64 12310909314810916455, ; 467: Microsoft.Extensions.Localization.dll => 0xaad922cbbb5a2e67 => 210
	i64 12313367145828839434, ; 468: System.IO.Pipelines => 0xaae1de2e1c17f00a => 243
	i64 12332222936682028543, ; 469: System.Runtime.Handles => 0xab24db6c07db5dff => 105
	i64 12341818387765915815, ; 470: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 176
	i64 12375446203996702057, ; 471: System.Configuration.dll => 0xabbe6ac12e2e0569 => 21
	i64 12451044538927396471, ; 472: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 276
	i64 12459959602091767212, ; 473: Microsoft.AspNetCore.Components.Authorization.dll => 0xaceaab3e0e65b5ac => 180
	i64 12466513435562512481, ; 474: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 290
	i64 12475113361194491050, ; 475: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 362
	i64 12487638416075308985, ; 476: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 270
	i64 12517810545449516888, ; 477: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 34
	i64 12538491095302438457, ; 478: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 258
	i64 12550732019250633519, ; 479: System.IO.Compression => 0xae2d28465e8e1b2f => 47
	i64 12572476546433904551, ; 480: AuthShared.dll => 0xae7a68cea11f6fa7 => 361
	i64 12681088699309157496, ; 481: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 341
	i64 12699999919562409296, ; 482: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 31
	i64 12700543734426720211, ; 483: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 259
	i64 12708238894395270091, ; 484: System.IO => 0xb05cbbf17d3ba3cb => 58
	i64 12708922737231849740, ; 485: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 135
	i64 12717050818822477433, ; 486: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 115
	i64 12753841065332862057, ; 487: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 313
	i64 12823819093633476069, ; 488: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 354
	i64 12828192437253469131, ; 489: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 324
	i64 12835242264250840079, ; 490: System.IO.Pipes => 0xb21ff0d5d6c0740f => 56
	i64 12843321153144804894, ; 491: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 216
	i64 12843770487262409629, ; 492: System.AppContext.dll => 0xb23e3d357debf39d => 8
	i64 12859557719246324186, ; 493: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 78
	i64 12888953538132067865, ; 494: Syncfusion.Blazor.SplitButtons.dll => 0xb2dec2f44ee04619 => 238
	i64 12982280885948128408, ; 495: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 269
	i64 13003699287675270979, ; 496: Microsoft.AspNetCore.Components.WebView.Maui => 0xb4766b9b07e27743 => 185
	i64 13041731019321118825, ; 497: Plugin.Maui.Audio => 0xb4fd894396d41069 => 224
	i64 13068258254871114833, ; 498: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 112
	i64 13129914918964716986, ; 499: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 273
	i64 13173818576982874404, ; 500: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 103
	i64 13221551921002590604, ; 501: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 328
	i64 13222659110913276082, ; 502: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 342
	i64 13343850469010654401, ; 503: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 171
	i64 13370592475155966277, ; 504: System.Runtime.Serialization => 0xb98de304062ea945 => 116
	i64 13381594904270902445, ; 505: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 336
	i64 13401370062847626945, ; 506: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 308
	i64 13404347523447273790, ; 507: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 263
	i64 13431476299110033919, ; 508: System.Net.WebClient => 0xba663087f18829ff => 77
	i64 13454009404024712428, ; 509: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 319
	i64 13463706743370286408, ; 510: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 86
	i64 13465488254036897740, ; 511: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 321
	i64 13467053111158216594, ; 512: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 356
	i64 13491513212026656886, ; 513: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 256
	i64 13540124433173649601, ; 514: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 357
	i64 13545416393490209236, ; 515: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 340
	i64 13550417756503177631, ; 516: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 203
	i64 13572454107664307259, ; 517: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 298
	i64 13578472628727169633, ; 518: System.Xml.XPath => 0xbc706ce9fba5c261 => 161
	i64 13580399111273692417, ; 519: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 4
	i64 13621154251410165619, ; 520: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 269
	i64 13642775863256762292, ; 521: Syncfusion.Blazor.Notifications.dll => 0xbd54e05d77b147b4 => 235
	i64 13647894001087880694, ; 522: System.Data.dll => 0xbd670f48cb071df6 => 26
	i64 13675589307506966157, ; 523: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 249
	i64 13702626353344114072, ; 524: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 33
	i64 13710614125866346983, ; 525: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 118
	i64 13713329104121190199, ; 526: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 38
	i64 13717397318615465333, ; 527: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 18
	i64 13755568601956062840, ; 528: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 335
	i64 13768883594457632599, ; 529: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 53
	i64 13814445057219246765, ; 530: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 338
	i64 13828521679616088467, ; 531: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 322
	i64 13881769479078963060, ; 532: System.Console.dll => 0xc0a5f3cade5c6774 => 22
	i64 13911222732217019342, ; 533: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 124
	i64 13928444506500929300, ; 534: System.Windows.dll => 0xc14bc67b8bba9714 => 155
	i64 13959074834287824816, ; 535: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 276
	i64 14018853139024289283, ; 536: Syncfusion.Blazor.Notifications => 0xc28cf8a7a5e99e03 => 235
	i64 14075334701871371868, ; 537: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 132
	i64 14082136096249122791, ; 538: Microsoft.AspNetCore.Metadata => 0xc36dcc2b4fa28fe7 => 190
	i64 14100563506285742564, ; 539: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 330
	i64 14124974489674258913, ; 540: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 258
	i64 14125464355221830302, ; 541: System.Threading.dll => 0xc407bafdbc707a9e => 149
	i64 14133832980772275001, ; 542: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 191
	i64 14178052285788134900, ; 543: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 245
	i64 14212104595480609394, ; 544: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 121
	i64 14220608275227875801, ; 545: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 29
	i64 14226382999226559092, ; 546: System.ServiceProcess => 0xc56e43f6938e2a74 => 133
	i64 14232023429000439693, ; 547: System.Resources.Writer.dll => 0xc5824de7789ba78d => 101
	i64 14254574811015963973, ; 548: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 135
	i64 14261073672896646636, ; 549: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 296
	i64 14298246716367104064, ; 550: System.Web.dll => 0xc66d93a217f4e840 => 154
	i64 14327695147300244862, ; 551: System.Reflection.dll => 0xc6d632d338eb4d7e => 98
	i64 14327709162229390963, ; 552: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 126
	i64 14331727281556788554, ; 553: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 246
	i64 14346402571976470310, ; 554: System.Net.Ping.dll => 0xc718a920f3686f26 => 70
	i64 14461014870687870182, ; 555: System.Net.Requests.dll => 0xc8afd8683afdece6 => 73
	i64 14464374589798375073, ; 556: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 351
	i64 14486659737292545672, ; 557: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 281
	i64 14495724990987328804, ; 558: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 299
	i64 14499818711296193409, ; 559: Blazored.Typeahead.dll => 0xc939b44b6a5f3381 => 174
	i64 14522721392235705434, ; 560: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 332
	i64 14551742072151931844, ; 561: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 137
	i64 14556034074661724008, ; 562: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 176
	i64 14561513370130550166, ; 563: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 125
	i64 14574160591280636898, ; 564: System.Net.Quic => 0xca41d1d72ec783e2 => 72
	i64 14622043554576106986, ; 565: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 112
	i64 14644440854989303794, ; 566: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 291
	i64 14669215534098758659, ; 567: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 201
	i64 14690985099581930927, ; 568: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 153
	i64 14705122255218365489, ; 569: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 343
	i64 14744092281598614090, ; 570: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 359
	i64 14792063746108907174, ; 571: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 319
	i64 14832630590065248058, ; 572: System.Security.Claims => 0xcdd816ef5d6e873a => 119
	i64 14852515768018889994, ; 573: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 267
	i64 14889905118082851278, ; 574: GoogleGson.dll => 0xcea391d0969961ce => 177
	i64 14892012299694389861, ; 575: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 360
	i64 14904040806490515477, ; 576: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 327
	i64 14912225920358050525, ; 577: System.Security.Principal.Windows => 0xcef2de7759506add => 128
	i64 14935719434541007538, ; 578: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 134
	i64 14954917835170835695, ; 579: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 202
	i64 14984936317414011727, ; 580: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 78
	i64 14987728460634540364, ; 581: System.IO.Compression.dll => 0xcfff1ba06622494c => 47
	i64 14988210264188246988, ; 582: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 270
	i64 15015154896917945444, ; 583: System.Net.Security.dll => 0xd0608bd33642dc64 => 74
	i64 15024878362326791334, ; 584: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 64
	i64 15056734556827475415, ; 585: Syncfusion.Blazor.Themes.dll => 0xd0f4444e310cddd7 => 239
	i64 15071021337266399595, ; 586: System.Resources.Reader.dll => 0xd127060e7a18a96b => 99
	i64 15076659072870671916, ; 587: System.ObjectModel.dll => 0xd13b0d8c1620662c => 85
	i64 15111608613780139878, ; 588: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 344
	i64 15115185479366240210, ; 589: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 44
	i64 15133485256822086103, ; 590: System.Linq.dll => 0xd204f0a9127dd9d7 => 62
	i64 15150743910298169673, ; 591: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 297
	i64 15199791680364902856, ; 592: Syncfusion.Blazor.Buttons => 0xd2f08200581679c8 => 225
	i64 15227001540531775957, ; 593: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 197
	i64 15234786388537674379, ; 594: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 38
	i64 15250465174479574862, ; 595: System.Globalization.Calendars.dll => 0xd3a489469852174e => 41
	i64 15272359115529052076, ; 596: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 260
	i64 15279429628684179188, ; 597: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 325
	i64 15299439993936780255, ; 598: System.Xml.XPath.dll => 0xd452879d55019bdf => 161
	i64 15338463749992804988, ; 599: System.Resources.Reader => 0xd4dd2b839286f27c => 99
	i64 15370028218478381000, ; 600: Microsoft.Extensions.Localization.Abstractions => 0xd54d4f3b162247c8 => 211
	i64 15370334346939861994, ; 601: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 265
	i64 15391712275433856905, ; 602: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 202
	i64 15427448221306938193, ; 603: Microsoft.AspNetCore.Components.Web => 0xd6194e6b4dbb6351 => 183
	i64 15481710163200268842, ; 604: Microsoft.Extensions.FileProviders.Composite => 0xd6da155e291b5a2a => 204
	i64 15526743539506359484, ; 605: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 136
	i64 15527772828719725935, ; 606: System.Console => 0xd77dbb1e38cd3d6f => 22
	i64 15530465045505749832, ; 607: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 66
	i64 15536481058354060254, ; 608: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 331
	i64 15541854775306130054, ; 609: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 126
	i64 15557562860424774966, ; 610: System.Net.Sockets => 0xd7e790fe7a6dc536 => 76
	i64 15582737692548360875, ; 611: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 289
	i64 15592226634512578529, ; 612: Microsoft.AspNetCore.Authorization.dll => 0xd862b7834f81b7e1 => 178
	i64 15609085926864131306, ; 613: System.dll => 0xd89e9cf3334914ea => 165
	i64 15661133872274321916, ; 614: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 157
	i64 15664356999916475676, ; 615: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 331
	i64 15710114879900314733, ; 616: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 7
	i64 15735700225633954557, ; 617: Microsoft.Extensions.Localization => 0xda606ffbe0f22afd => 210
	i64 15743187114543869802, ; 618: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 339
	i64 15755368083429170162, ; 619: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 50
	i64 15777549416145007739, ; 620: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 303
	i64 15783653065526199428, ; 621: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 332
	i64 15817206913877585035, ; 622: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 145
	i64 15827202283623377193, ; 623: Microsoft.Extensions.Configuration.Json.dll => 0xdba5849eef9f6929 => 200
	i64 15847085070278954535, ; 624: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 140
	i64 15852824340364052161, ; 625: Microsoft.AspNetCore.Http.Features.dll => 0xdc008bbee610c6c1 => 188
	i64 15885744048853936810, ; 626: System.Resources.Writer => 0xdc75800bd0b6eaaa => 101
	i64 15928521404965645318, ; 627: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 218
	i64 15934062614519587357, ; 628: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 124
	i64 15937190497610202713, ; 629: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 121
	i64 15941100832719536923, ; 630: Syncfusion.Blazor.Navigations => 0xdd3a2abf6eee831b => 234
	i64 15963349826457351533, ; 631: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 143
	i64 15971679995444160383, ; 632: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 40
	i64 16018552496348375205, ; 633: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 69
	i64 16043046462692404242, ; 634: Syncfusion.Blazor.Navigations.dll => 0xdea459c213de2c12 => 234
	i64 16054465462676478687, ; 635: System.Globalization.Extensions => 0xdecceb47319bdadf => 42
	i64 16154507427712707110, ; 636: System => 0xe03056ea4e39aa26 => 165
	i64 16219561732052121626, ; 637: System.Net.Security => 0xe1177575db7c781a => 74
	i64 16288847719894691167, ; 638: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 345
	i64 16315482530584035869, ; 639: WindowsBase.dll => 0xe26c3ceb1e8d821d => 166
	i64 16321164108206115771, ; 640: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 213
	i64 16337011941688632206, ; 641: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 128
	i64 16361933716545543812, ; 642: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 275
	i64 16394303729710043470, ; 643: AuthShared => 0xe3844461a53a914e => 361
	i64 16423015068819898779, ; 644: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 324
	i64 16454459195343277943, ; 645: System.Net.NetworkInformation => 0xe459fb756d988f77 => 69
	i64 16496768397145114574, ; 646: Mono.Android.Export.dll => 0xe4f04b741db987ce => 170
	i64 16589693266713801121, ; 647: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 288
	i64 16621146507174665210, ; 648: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 262
	i64 16649148416072044166, ; 649: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 223
	i64 16677317093839702854, ; 650: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 295
	i64 16702652415771857902, ; 651: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 152
	i64 16709499819875633724, ; 652: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 46
	i64 16737807731308835127, ; 653: System.Runtime.Intrinsics => 0xe848a3736f733137 => 109
	i64 16758309481308491337, ; 654: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 49
	i64 16762783179241323229, ; 655: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 97
	i64 16765015072123548030, ; 656: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 32
	i64 16794607523202238486, ; 657: Syncfusion.Blazor.Popups => 0xe9126e8f8a928816 => 236
	i64 16822611501064131242, ; 658: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 25
	i64 16833383113903931215, ; 659: mscorlib => 0xe99c30c1484d7f4f => 167
	i64 16846314320592140502, ; 660: ar/SafeOpsBlazor.resources.dll => 0xe9ca219e757878d6 => 1
	i64 16856067890322379635, ; 661: System.Data.Common.dll => 0xe9ecc87060889373 => 24
	i64 16890310621557459193, ; 662: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 139
	i64 16933958494752847024, ; 663: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 79
	i64 16942731696432749159, ; 664: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 352
	i64 16977952268158210142, ; 665: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 55
	i64 16989020923549080504, ; 666: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 288
	i64 16998075588627545693, ; 667: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 293
	i64 17008137082415910100, ; 668: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 12
	i64 17024911836938395553, ; 669: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 251
	i64 17031351772568316411, ; 670: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 292
	i64 17037200463775726619, ; 671: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 279
	i64 17047433665992082296, ; 672: Microsoft.Extensions.Configuration.FileExtensions => 0xec94a699197e4378 => 199
	i64 17062143951396181894, ; 673: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 18
	i64 17079998892748052666, ; 674: Microsoft.AspNetCore.Components.dll => 0xed08587fce5018ba => 179
	i64 17080685096938066842, ; 675: Microsoft.AspNetCore.Components.QuickGrid => 0xed0ac8992b4d539a => 182
	i64 17089008752050867324, ; 676: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 359
	i64 17116924499910326646, ; 677: Syncfusion.Blazor.Data => 0xed8b8824b055f976 => 228
	i64 17118171214553292978, ; 678: System.Threading.Channels => 0xed8ff6060fc420b2 => 140
	i64 17187273293601214786, ; 679: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 15
	i64 17201328579425343169, ; 680: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 17
	i64 17202182880784296190, ; 681: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 123
	i64 17205988430934219272, ; 682: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 207
	i64 17230721278011714856, ; 683: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 88
	i64 17234219099804750107, ; 684: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 150
	i64 17260702271250283638, ; 685: System.Data.Common => 0xef8a5543bba6bc76 => 24
	i64 17333249706306540043, ; 686: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 35
	i64 17338386382517543202, ; 687: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 80
	i64 17342750010158924305, ; 688: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 337
	i64 17360349973592121190, ; 689: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 317
	i64 17438153253682247751, ; 690: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 352
	i64 17470386307322966175, ; 691: System.Threading.Timer => 0xf27347c8d0d5709f => 148
	i64 17509662556995089465, ; 692: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 81
	i64 17514990004910432069, ; 693: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 335
	i64 17522591619082469157, ; 694: GoogleGson => 0xf32cc03d27a5bf25 => 177
	i64 17590473451926037903, ; 695: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 244
	i64 17623389608345532001, ; 696: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 347
	i64 17627500474728259406, ; 697: System.Globalization => 0xf4a176498a351f4e => 43
	i64 17685921127322830888, ; 698: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 28
	i64 17702523067201099846, ; 699: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 358
	i64 17704177640604968747, ; 700: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 290
	i64 17710060891934109755, ; 701: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 287
	i64 17712670374920797664, ; 702: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 108
	i64 17777860260071588075, ; 703: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 111
	i64 17838668724098252521, ; 704: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 9
	i64 17864403808740949822, ; 705: Microsoft.AspNetCore.Components.QuickGrid.dll => 0xf7eb1c9d4823bf3e => 182
	i64 17891337867145587222, ; 706: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 320
	i64 17910264068556501837, ; 707: Microsoft.Extensions.Identity.Core => 0xf88e0a4717c0b34d => 208
	i64 17928294245072900555, ; 708: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 45
	i64 17992315986609351877, ; 709: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 162
	i64 18017743553296241350, ; 710: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 194
	i64 18025913125965088385, ; 711: System.Threading => 0xfa28e87b91334681 => 149
	i64 18099568558057551825, ; 712: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 346
	i64 18116111925905154859, ; 713: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 256
	i64 18121036031235206392, ; 714: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 292
	i64 18146411883821974900, ; 715: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 39
	i64 18146811631844267958, ; 716: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 17
	i64 18185297593982308516, ; 717: Syncfusion.PdfExport.Net => 0xfc5f27cfd814d0a4 => 241
	i64 18225059387460068507, ; 718: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 147
	i64 18245806341561545090, ; 719: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 10
	i64 18260797123374478311, ; 720: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 273
	i64 18305135509493619199, ; 721: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 294
	i64 18318849532986632368, ; 722: System.Security.dll => 0xfe39a097c37fa8b0 => 131
	i64 18324163916253801303, ; 723: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 341
	i64 18380184030268848184, ; 724: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 310
	i64 18439108438687598470 ; 725: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 95
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [726 x i32] [
	i32 272, ; 0
	i32 216, ; 1
	i32 172, ; 2
	i32 222, ; 3
	i32 59, ; 4
	i32 259, ; 5
	i32 152, ; 6
	i32 300, ; 7
	i32 303, ; 8
	i32 266, ; 9
	i32 133, ; 10
	i32 237, ; 11
	i32 57, ; 12
	i32 302, ; 13
	i32 334, ; 14
	i32 96, ; 15
	i32 285, ; 16
	i32 199, ; 17
	i32 130, ; 18
	i32 227, ; 19
	i32 198, ; 20
	i32 205, ; 21
	i32 146, ; 22
	i32 260, ; 23
	i32 20, ; 24
	i32 337, ; 25
	i32 271, ; 26
	i32 286, ; 27
	i32 151, ; 28
	i32 105, ; 29
	i32 96, ; 30
	i32 238, ; 31
	i32 315, ; 32
	i32 345, ; 33
	i32 37, ; 34
	i32 29, ; 35
	i32 255, ; 36
	i32 293, ; 37
	i32 51, ; 38
	i32 0, ; 39
	i32 116, ; 40
	i32 71, ; 41
	i32 219, ; 42
	i32 66, ; 43
	i32 171, ; 44
	i32 146, ; 45
	i32 343, ; 46
	i32 314, ; 47
	i32 254, ; 48
	i32 289, ; 49
	i32 279, ; 50
	i32 186, ; 51
	i32 41, ; 52
	i32 90, ; 53
	i32 82, ; 54
	i32 232, ; 55
	i32 67, ; 56
	i32 63, ; 57
	i32 87, ; 58
	i32 217, ; 59
	i32 253, ; 60
	i32 107, ; 61
	i32 333, ; 62
	i32 300, ; 63
	i32 103, ; 64
	i32 36, ; 65
	i32 250, ; 66
	i32 355, ; 67
	i32 302, ; 68
	i32 220, ; 69
	i32 355, ; 70
	i32 120, ; 71
	i32 287, ; 72
	i32 329, ; 73
	i32 347, ; 74
	i32 143, ; 75
	i32 142, ; 76
	i32 323, ; 77
	i32 54, ; 78
	i32 36, ; 79
	i32 142, ; 80
	i32 247, ; 81
	i32 257, ; 82
	i32 192, ; 83
	i32 214, ; 84
	i32 231, ; 85
	i32 271, ; 86
	i32 10, ; 87
	i32 16, ; 88
	i32 185, ; 89
	i32 351, ; 90
	i32 299, ; 91
	i32 52, ; 92
	i32 282, ; 93
	i32 137, ; 94
	i32 102, ; 95
	i32 264, ; 96
	i32 309, ; 97
	i32 117, ; 98
	i32 248, ; 99
	i32 164, ; 100
	i32 354, ; 101
	i32 189, ; 102
	i32 167, ; 103
	i32 68, ; 104
	i32 201, ; 105
	i32 329, ; 106
	i32 81, ; 107
	i32 217, ; 108
	i32 102, ; 109
	i32 304, ; 110
	i32 118, ; 111
	i32 334, ; 112
	i32 316, ; 113
	i32 79, ; 114
	i32 315, ; 115
	i32 233, ; 116
	i32 115, ; 117
	i32 122, ; 118
	i32 49, ; 119
	i32 178, ; 120
	i32 129, ; 121
	i32 280, ; 122
	i32 251, ; 123
	i32 83, ; 124
	i32 111, ; 125
	i32 76, ; 126
	i32 326, ; 127
	i32 174, ; 128
	i32 203, ; 129
	i32 222, ; 130
	i32 54, ; 131
	i32 306, ; 132
	i32 196, ; 133
	i32 70, ; 134
	i32 305, ; 135
	i32 195, ; 136
	i32 84, ; 137
	i32 173, ; 138
	i32 349, ; 139
	i32 117, ; 140
	i32 197, ; 141
	i32 157, ; 142
	i32 196, ; 143
	i32 245, ; 144
	i32 168, ; 145
	i32 298, ; 146
	i32 184, ; 147
	i32 272, ; 148
	i32 190, ; 149
	i32 212, ; 150
	i32 33, ; 151
	i32 206, ; 152
	i32 220, ; 153
	i32 123, ; 154
	i32 73, ; 155
	i32 240, ; 156
	i32 63, ; 157
	i32 162, ; 158
	i32 114, ; 159
	i32 89, ; 160
	i32 218, ; 161
	i32 360, ; 162
	i32 106, ; 163
	i32 20, ; 164
	i32 147, ; 165
	i32 119, ; 166
	i32 59, ; 167
	i32 266, ; 168
	i32 19, ; 169
	i32 53, ; 170
	i32 93, ; 171
	i32 357, ; 172
	i32 56, ; 173
	i32 181, ; 174
	i32 130, ; 175
	i32 153, ; 176
	i32 42, ; 177
	i32 193, ; 178
	i32 93, ; 179
	i32 192, ; 180
	i32 310, ; 181
	i32 189, ; 182
	i32 51, ; 183
	i32 327, ; 184
	i32 163, ; 185
	i32 15, ; 186
	i32 284, ; 187
	i32 228, ; 188
	i32 248, ; 189
	i32 305, ; 190
	i32 37, ; 191
	i32 68, ; 192
	i32 110, ; 193
	i32 249, ; 194
	i32 100, ; 195
	i32 100, ; 196
	i32 13, ; 197
	i32 13, ; 198
	i32 183, ; 199
	i32 291, ; 200
	i32 227, ; 201
	i32 27, ; 202
	i32 129, ; 203
	i32 77, ; 204
	i32 283, ; 205
	i32 110, ; 206
	i32 309, ; 207
	i32 307, ; 208
	i32 107, ; 209
	i32 4, ; 210
	i32 28, ; 211
	i32 262, ; 212
	i32 158, ; 213
	i32 353, ; 214
	i32 23, ; 215
	i32 356, ; 216
	i32 50, ; 217
	i32 44, ; 218
	i32 127, ; 219
	i32 252, ; 220
	i32 230, ; 221
	i32 60, ; 222
	i32 120, ; 223
	i32 312, ; 224
	i32 275, ; 225
	i32 211, ; 226
	i32 261, ; 227
	i32 5, ; 228
	i32 281, ; 229
	i32 301, ; 230
	i32 233, ; 231
	i32 39, ; 232
	i32 125, ; 233
	i32 350, ; 234
	i32 301, ; 235
	i32 180, ; 236
	i32 350, ; 237
	i32 232, ; 238
	i32 138, ; 239
	i32 150, ; 240
	i32 86, ; 241
	i32 91, ; 242
	i32 285, ; 243
	i32 1, ; 244
	i32 362, ; 245
	i32 282, ; 246
	i32 338, ; 247
	i32 257, ; 248
	i32 268, ; 249
	i32 313, ; 250
	i32 215, ; 251
	i32 318, ; 252
	i32 283, ; 253
	i32 134, ; 254
	i32 97, ; 255
	i32 5, ; 256
	i32 346, ; 257
	i32 106, ; 258
	i32 349, ; 259
	i32 34, ; 260
	i32 155, ; 261
	i32 159, ; 262
	i32 156, ; 263
	i32 83, ; 264
	i32 184, ; 265
	i32 277, ; 266
	i32 144, ; 267
	i32 88, ; 268
	i32 21, ; 269
	i32 278, ; 270
	i32 52, ; 271
	i32 247, ; 272
	i32 353, ; 273
	i32 62, ; 274
	i32 55, ; 275
	i32 6, ; 276
	i32 98, ; 277
	i32 246, ; 278
	i32 19, ; 279
	i32 226, ; 280
	i32 156, ; 281
	i32 85, ; 282
	i32 30, ; 283
	i32 46, ; 284
	i32 65, ; 285
	i32 67, ; 286
	i32 344, ; 287
	i32 173, ; 288
	i32 286, ; 289
	i32 3, ; 290
	i32 321, ; 291
	i32 48, ; 292
	i32 26, ; 293
	i32 254, ; 294
	i32 194, ; 295
	i32 181, ; 296
	i32 166, ; 297
	i32 109, ; 298
	i32 14, ; 299
	i32 280, ; 300
	i32 64, ; 301
	i32 242, ; 302
	i32 25, ; 303
	i32 94, ; 304
	i32 169, ; 305
	i32 14, ; 306
	i32 325, ; 307
	i32 223, ; 308
	i32 30, ; 309
	i32 104, ; 310
	i32 16, ; 311
	i32 127, ; 312
	i32 263, ; 313
	i32 295, ; 314
	i32 92, ; 315
	i32 284, ; 316
	i32 187, ; 317
	i32 209, ; 318
	i32 11, ; 319
	i32 87, ; 320
	i32 274, ; 321
	i32 175, ; 322
	i32 307, ; 323
	i32 348, ; 324
	i32 72, ; 325
	i32 169, ; 326
	i32 3, ; 327
	i32 294, ; 328
	i32 7, ; 329
	i32 348, ; 330
	i32 45, ; 331
	i32 242, ; 332
	i32 239, ; 333
	i32 322, ; 334
	i32 159, ; 335
	i32 297, ; 336
	i32 113, ; 337
	i32 358, ; 338
	i32 195, ; 339
	i32 122, ; 340
	i32 236, ; 341
	i32 191, ; 342
	i32 312, ; 343
	i32 253, ; 344
	i32 231, ; 345
	i32 160, ; 346
	i32 187, ; 347
	i32 225, ; 348
	i32 132, ; 349
	i32 317, ; 350
	i32 58, ; 351
	i32 226, ; 352
	i32 200, ; 353
	i32 139, ; 354
	i32 84, ; 355
	i32 31, ; 356
	i32 264, ; 357
	i32 12, ; 358
	i32 314, ; 359
	i32 172, ; 360
	i32 261, ; 361
	i32 151, ; 362
	i32 95, ; 363
	i32 186, ; 364
	i32 274, ; 365
	i32 61, ; 366
	i32 221, ; 367
	i32 158, ; 368
	i32 333, ; 369
	i32 214, ; 370
	i32 65, ; 371
	i32 89, ; 372
	i32 80, ; 373
	i32 48, ; 374
	i32 219, ; 375
	i32 144, ; 376
	i32 330, ; 377
	i32 237, ; 378
	i32 198, ; 379
	i32 241, ; 380
	i32 323, ; 381
	i32 268, ; 382
	i32 75, ; 383
	i32 92, ; 384
	i32 320, ; 385
	i32 136, ; 386
	i32 91, ; 387
	i32 306, ; 388
	i32 326, ; 389
	i32 265, ; 390
	i32 229, ; 391
	i32 328, ; 392
	i32 113, ; 393
	i32 43, ; 394
	i32 160, ; 395
	i32 6, ; 396
	i32 240, ; 397
	i32 104, ; 398
	i32 205, ; 399
	i32 71, ; 400
	i32 193, ; 401
	i32 61, ; 402
	i32 40, ; 403
	i32 255, ; 404
	i32 2, ; 405
	i32 175, ; 406
	i32 154, ; 407
	i32 57, ; 408
	i32 35, ; 409
	i32 213, ; 410
	i32 221, ; 411
	i32 229, ; 412
	i32 252, ; 413
	i32 23, ; 414
	i32 164, ; 415
	i32 188, ; 416
	i32 204, ; 417
	i32 318, ; 418
	i32 339, ; 419
	i32 316, ; 420
	i32 311, ; 421
	i32 141, ; 422
	i32 179, ; 423
	i32 342, ; 424
	i32 215, ; 425
	i32 90, ; 426
	i32 148, ; 427
	i32 267, ; 428
	i32 163, ; 429
	i32 2, ; 430
	i32 296, ; 431
	i32 8, ; 432
	i32 170, ; 433
	i32 32, ; 434
	i32 108, ; 435
	i32 277, ; 436
	i32 243, ; 437
	i32 340, ; 438
	i32 311, ; 439
	i32 212, ; 440
	i32 0, ; 441
	i32 250, ; 442
	i32 304, ; 443
	i32 208, ; 444
	i32 168, ; 445
	i32 209, ; 446
	i32 278, ; 447
	i32 141, ; 448
	i32 336, ; 449
	i32 60, ; 450
	i32 145, ; 451
	i32 82, ; 452
	i32 75, ; 453
	i32 206, ; 454
	i32 207, ; 455
	i32 131, ; 456
	i32 224, ; 457
	i32 27, ; 458
	i32 9, ; 459
	i32 94, ; 460
	i32 308, ; 461
	i32 138, ; 462
	i32 230, ; 463
	i32 244, ; 464
	i32 114, ; 465
	i32 11, ; 466
	i32 210, ; 467
	i32 243, ; 468
	i32 105, ; 469
	i32 176, ; 470
	i32 21, ; 471
	i32 276, ; 472
	i32 180, ; 473
	i32 290, ; 474
	i32 362, ; 475
	i32 270, ; 476
	i32 34, ; 477
	i32 258, ; 478
	i32 47, ; 479
	i32 361, ; 480
	i32 341, ; 481
	i32 31, ; 482
	i32 259, ; 483
	i32 58, ; 484
	i32 135, ; 485
	i32 115, ; 486
	i32 313, ; 487
	i32 354, ; 488
	i32 324, ; 489
	i32 56, ; 490
	i32 216, ; 491
	i32 8, ; 492
	i32 78, ; 493
	i32 238, ; 494
	i32 269, ; 495
	i32 185, ; 496
	i32 224, ; 497
	i32 112, ; 498
	i32 273, ; 499
	i32 103, ; 500
	i32 328, ; 501
	i32 342, ; 502
	i32 171, ; 503
	i32 116, ; 504
	i32 336, ; 505
	i32 308, ; 506
	i32 263, ; 507
	i32 77, ; 508
	i32 319, ; 509
	i32 86, ; 510
	i32 321, ; 511
	i32 356, ; 512
	i32 256, ; 513
	i32 357, ; 514
	i32 340, ; 515
	i32 203, ; 516
	i32 298, ; 517
	i32 161, ; 518
	i32 4, ; 519
	i32 269, ; 520
	i32 235, ; 521
	i32 26, ; 522
	i32 249, ; 523
	i32 33, ; 524
	i32 118, ; 525
	i32 38, ; 526
	i32 18, ; 527
	i32 335, ; 528
	i32 53, ; 529
	i32 338, ; 530
	i32 322, ; 531
	i32 22, ; 532
	i32 124, ; 533
	i32 155, ; 534
	i32 276, ; 535
	i32 235, ; 536
	i32 132, ; 537
	i32 190, ; 538
	i32 330, ; 539
	i32 258, ; 540
	i32 149, ; 541
	i32 191, ; 542
	i32 245, ; 543
	i32 121, ; 544
	i32 29, ; 545
	i32 133, ; 546
	i32 101, ; 547
	i32 135, ; 548
	i32 296, ; 549
	i32 154, ; 550
	i32 98, ; 551
	i32 126, ; 552
	i32 246, ; 553
	i32 70, ; 554
	i32 73, ; 555
	i32 351, ; 556
	i32 281, ; 557
	i32 299, ; 558
	i32 174, ; 559
	i32 332, ; 560
	i32 137, ; 561
	i32 176, ; 562
	i32 125, ; 563
	i32 72, ; 564
	i32 112, ; 565
	i32 291, ; 566
	i32 201, ; 567
	i32 153, ; 568
	i32 343, ; 569
	i32 359, ; 570
	i32 319, ; 571
	i32 119, ; 572
	i32 267, ; 573
	i32 177, ; 574
	i32 360, ; 575
	i32 327, ; 576
	i32 128, ; 577
	i32 134, ; 578
	i32 202, ; 579
	i32 78, ; 580
	i32 47, ; 581
	i32 270, ; 582
	i32 74, ; 583
	i32 64, ; 584
	i32 239, ; 585
	i32 99, ; 586
	i32 85, ; 587
	i32 344, ; 588
	i32 44, ; 589
	i32 62, ; 590
	i32 297, ; 591
	i32 225, ; 592
	i32 197, ; 593
	i32 38, ; 594
	i32 41, ; 595
	i32 260, ; 596
	i32 325, ; 597
	i32 161, ; 598
	i32 99, ; 599
	i32 211, ; 600
	i32 265, ; 601
	i32 202, ; 602
	i32 183, ; 603
	i32 204, ; 604
	i32 136, ; 605
	i32 22, ; 606
	i32 66, ; 607
	i32 331, ; 608
	i32 126, ; 609
	i32 76, ; 610
	i32 289, ; 611
	i32 178, ; 612
	i32 165, ; 613
	i32 157, ; 614
	i32 331, ; 615
	i32 7, ; 616
	i32 210, ; 617
	i32 339, ; 618
	i32 50, ; 619
	i32 303, ; 620
	i32 332, ; 621
	i32 145, ; 622
	i32 200, ; 623
	i32 140, ; 624
	i32 188, ; 625
	i32 101, ; 626
	i32 218, ; 627
	i32 124, ; 628
	i32 121, ; 629
	i32 234, ; 630
	i32 143, ; 631
	i32 40, ; 632
	i32 69, ; 633
	i32 234, ; 634
	i32 42, ; 635
	i32 165, ; 636
	i32 74, ; 637
	i32 345, ; 638
	i32 166, ; 639
	i32 213, ; 640
	i32 128, ; 641
	i32 275, ; 642
	i32 361, ; 643
	i32 324, ; 644
	i32 69, ; 645
	i32 170, ; 646
	i32 288, ; 647
	i32 262, ; 648
	i32 223, ; 649
	i32 295, ; 650
	i32 152, ; 651
	i32 46, ; 652
	i32 109, ; 653
	i32 49, ; 654
	i32 97, ; 655
	i32 32, ; 656
	i32 236, ; 657
	i32 25, ; 658
	i32 167, ; 659
	i32 1, ; 660
	i32 24, ; 661
	i32 139, ; 662
	i32 79, ; 663
	i32 352, ; 664
	i32 55, ; 665
	i32 288, ; 666
	i32 293, ; 667
	i32 12, ; 668
	i32 251, ; 669
	i32 292, ; 670
	i32 279, ; 671
	i32 199, ; 672
	i32 18, ; 673
	i32 179, ; 674
	i32 182, ; 675
	i32 359, ; 676
	i32 228, ; 677
	i32 140, ; 678
	i32 15, ; 679
	i32 17, ; 680
	i32 123, ; 681
	i32 207, ; 682
	i32 88, ; 683
	i32 150, ; 684
	i32 24, ; 685
	i32 35, ; 686
	i32 80, ; 687
	i32 337, ; 688
	i32 317, ; 689
	i32 352, ; 690
	i32 148, ; 691
	i32 81, ; 692
	i32 335, ; 693
	i32 177, ; 694
	i32 244, ; 695
	i32 347, ; 696
	i32 43, ; 697
	i32 28, ; 698
	i32 358, ; 699
	i32 290, ; 700
	i32 287, ; 701
	i32 108, ; 702
	i32 111, ; 703
	i32 9, ; 704
	i32 182, ; 705
	i32 320, ; 706
	i32 208, ; 707
	i32 45, ; 708
	i32 162, ; 709
	i32 194, ; 710
	i32 149, ; 711
	i32 346, ; 712
	i32 256, ; 713
	i32 292, ; 714
	i32 39, ; 715
	i32 17, ; 716
	i32 241, ; 717
	i32 147, ; 718
	i32 10, ; 719
	i32 273, ; 720
	i32 294, ; 721
	i32 131, ; 722
	i32 341, ; 723
	i32 310, ; 724
	i32 95 ; 725
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 68175bbe5a39140c642dab294cf184ecf72eece0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
