; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [366 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [726 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 69
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 68
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 109
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 285
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 319
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 49
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 81
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 146
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 31
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 360
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 125
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 223
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 103
	i32 83768722, ; 13: Microsoft.AspNetCore.Cryptography.Internal => 0x4fe3592 => 186
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 303
	i32 117431740, ; 15: System.Runtime.InteropServices => 0x6ffddbc => 108
	i32 120558881, ; 16: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 303
	i32 122350210, ; 17: System.Threading.Channels.dll => 0x74aea82 => 140
	i32 134690465, ; 18: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 323
	i32 142721839, ; 19: System.Net.WebHeaderCollection => 0x881c32f => 78
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 125
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 15
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 259
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 133
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 305
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 152
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 357
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 358
	i32 204291415, ; 28: Syncfusion.Blazor.Data => 0xc2d3d57 => 228
	i32 204398784, ; 29: Syncfusion.Blazor.DropDowns.dll => 0xc2ee0c0 => 230
	i32 205061960, ; 30: System.ComponentModel => 0xc38ff48 => 20
	i32 209399409, ; 31: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 257
	i32 220171995, ; 32: System.Diagnostics.Debug => 0xd1f8edb => 28
	i32 230216969, ; 33: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 279
	i32 230752869, ; 34: Microsoft.CSharp.dll => 0xdc10265 => 3
	i32 231409092, ; 35: System.Linq.Parallel => 0xdcb05c4 => 60
	i32 231814094, ; 36: System.Globalization => 0xdd133ce => 43
	i32 236299393, ; 37: SafeOpsBlazor.dll => 0xe15a481 => 2
	i32 244348769, ; 38: Microsoft.AspNetCore.Components.Authorization => 0xe907761 => 180
	i32 246610117, ; 39: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 92
	i32 254259026, ; 40: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 179
	i32 261689757, ; 41: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 262
	i32 276479776, ; 42: System.Threading.Timer.dll => 0x107abf20 => 148
	i32 278686392, ; 43: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 281
	i32 280482487, ; 44: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 278
	i32 280992041, ; 45: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 329
	i32 291076382, ; 46: System.IO.Pipes.AccessControl.dll => 0x1159791e => 55
	i32 298918909, ; 47: System.Net.Ping.dll => 0x11d123fd => 70
	i32 317674968, ; 48: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 357
	i32 318968648, ; 49: Xamarin.AndroidX.Activity.dll => 0x13031348 => 248
	i32 321597661, ; 50: System.Numerics => 0x132b30dd => 84
	i32 336156722, ; 51: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 342
	i32 342366114, ; 52: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 280
	i32 356389973, ; 53: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 341
	i32 360082299, ; 54: System.ServiceModel.Web => 0x15766b7b => 132
	i32 367780167, ; 55: System.IO.Pipes => 0x15ebe147 => 56
	i32 374914964, ; 56: System.Transactions.Local => 0x1658bf94 => 150
	i32 375677976, ; 57: System.Net.ServicePoint.dll => 0x16646418 => 75
	i32 379916513, ; 58: System.Threading.Thread.dll => 0x16a510e1 => 146
	i32 385762202, ; 59: System.Memory.dll => 0x16fe439a => 63
	i32 392610295, ; 60: System.Threading.ThreadPool.dll => 0x1766c1f7 => 147
	i32 395744057, ; 61: _Microsoft.Android.Resource.Designer => 0x17969339 => 362
	i32 403441872, ; 62: WindowsBase => 0x180c08d0 => 166
	i32 435591531, ; 63: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 353
	i32 441335492, ; 64: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 263
	i32 442565967, ; 65: System.Collections => 0x1a61054f => 14
	i32 450948140, ; 66: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 276
	i32 451504562, ; 67: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 126
	i32 456227837, ; 68: System.Web.HttpUtility.dll => 0x1b317bfd => 153
	i32 459347974, ; 69: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 114
	i32 465846621, ; 70: mscorlib => 0x1bc4415d => 167
	i32 469710990, ; 71: System.dll => 0x1bff388e => 165
	i32 476646585, ; 72: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 278
	i32 486930444, ; 73: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 291
	i32 498788369, ; 74: System.ObjectModel => 0x1dbae811 => 85
	i32 500358224, ; 75: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 340
	i32 503918385, ; 76: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 334
	i32 513247710, ; 77: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 216
	i32 526420162, ; 78: System.Transactions.dll => 0x1f6088c2 => 151
	i32 527452488, ; 79: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 323
	i32 530272170, ; 80: System.Linq.Queryable => 0x1f9b4faa => 61
	i32 539058512, ; 81: Microsoft.Extensions.Logging => 0x20216150 => 212
	i32 540030774, ; 82: System.IO.FileSystem.dll => 0x20303736 => 52
	i32 545304856, ; 83: System.Runtime.Extensions => 0x2080b118 => 104
	i32 546455878, ; 84: System.Runtime.Serialization.Xml => 0x20924146 => 115
	i32 549171840, ; 85: System.Globalization.Calendars => 0x20bbb280 => 41
	i32 557405415, ; 86: Jsr305Binding => 0x213954e7 => 316
	i32 569601784, ; 87: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 314
	i32 571435654, ; 88: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 205
	i32 577335427, ; 89: System.Security.Cryptography.Cng => 0x22697083 => 121
	i32 592146354, ; 90: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 348
	i32 597488923, ; 91: CommunityToolkit.Maui => 0x239cf51b => 175
	i32 601371474, ; 92: System.IO.IsolatedStorage.dll => 0x23d83352 => 53
	i32 605376203, ; 93: System.IO.Compression.FileSystem => 0x24154ecb => 45
	i32 613668793, ; 94: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 120
	i32 627609679, ; 95: Xamarin.AndroidX.CustomView => 0x2568904f => 268
	i32 627931235, ; 96: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 346
	i32 639843206, ; 97: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 274
	i32 643868501, ; 98: System.Net => 0x2660a755 => 82
	i32 662205335, ; 99: System.Text.Encodings.Web.dll => 0x27787397 => 137
	i32 663517072, ; 100: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 310
	i32 666292255, ; 101: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 255
	i32 672442732, ; 102: System.Collections.Concurrent => 0x2814a96c => 10
	i32 683518922, ; 103: System.Net.Security => 0x28bdabca => 74
	i32 683966610, ; 104: Syncfusion.ExcelExport.Net => 0x28c48092 => 240
	i32 688181140, ; 105: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 328
	i32 690569205, ; 106: System.Xml.Linq.dll => 0x29293ff5 => 156
	i32 691348768, ; 107: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 325
	i32 693804605, ; 108: System.Windows => 0x295a9e3d => 155
	i32 699345723, ; 109: System.Reflection.Emit => 0x29af2b3b => 93
	i32 700284507, ; 110: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 320
	i32 700358131, ; 111: System.IO.Compression.ZipFile => 0x29be9df3 => 46
	i32 706645707, ; 112: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 343
	i32 709557578, ; 113: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 331
	i32 720511267, ; 114: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 324
	i32 722857257, ; 115: System.Runtime.Loader.dll => 0x2b15ed29 => 110
	i32 735137430, ; 116: System.Security.SecureString.dll => 0x2bd14e96 => 130
	i32 752232764, ; 117: System.Diagnostics.Contracts.dll => 0x2cd6293c => 27
	i32 755313932, ; 118: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 245
	i32 759454413, ; 119: System.Net.Requests => 0x2d445acd => 73
	i32 762598435, ; 120: System.IO.Pipes.dll => 0x2d745423 => 56
	i32 775507847, ; 121: System.IO.Compression => 0x2e394f87 => 47
	i32 777317022, ; 122: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 352
	i32 789151979, ; 123: Microsoft.Extensions.Options => 0x2f0980eb => 215
	i32 790371945, ; 124: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 269
	i32 804008546, ; 125: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 185
	i32 804715423, ; 126: System.Data.Common => 0x2ff6fb9f => 24
	i32 807930345, ; 127: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 283
	i32 823281589, ; 128: System.Private.Uri.dll => 0x311247b5 => 87
	i32 830298997, ; 129: System.IO.Compression.Brotli => 0x317d5b75 => 44
	i32 832635846, ; 130: System.Xml.XPath.dll => 0x31a103c6 => 161
	i32 834051424, ; 131: System.Net.Quic => 0x31b69d60 => 72
	i32 843511501, ; 132: Xamarin.AndroidX.Print => 0x3246f6cd => 296
	i32 873119928, ; 133: Microsoft.VisualBasic => 0x340ac0b8 => 5
	i32 877678880, ; 134: System.Globalization.dll => 0x34505120 => 43
	i32 878954865, ; 135: System.Net.Http.Json => 0x3463c971 => 64
	i32 904024072, ; 136: System.ComponentModel.Primitives.dll => 0x35e25008 => 18
	i32 911108515, ; 137: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 54
	i32 926902833, ; 138: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 355
	i32 928116545, ; 139: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 319
	i32 952186615, ; 140: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 106
	i32 956575887, ; 141: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 324
	i32 966729478, ; 142: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 317
	i32 967690846, ; 143: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 280
	i32 975236339, ; 144: System.Diagnostics.Tracing => 0x3a20ecf3 => 35
	i32 975874589, ; 145: System.Xml.XDocument => 0x3a2aaa1d => 159
	i32 986514023, ; 146: System.Private.DataContractSerialization.dll => 0x3acd0267 => 86
	i32 987214855, ; 147: System.Diagnostics.Tools => 0x3ad7b407 => 33
	i32 992768348, ; 148: System.Collections.dll => 0x3b2c715c => 14
	i32 994442037, ; 149: System.IO.FileSystem => 0x3b45fb35 => 52
	i32 999186168, ; 150: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 207
	i32 1001831731, ; 151: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 57
	i32 1012816738, ; 152: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 300
	i32 1019214401, ; 153: System.Drawing => 0x3cbffa41 => 37
	i32 1028951442, ; 154: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 202
	i32 1029334545, ; 155: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 330
	i32 1031528504, ; 156: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 318
	i32 1035644815, ; 157: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 253
	i32 1036536393, ; 158: System.Drawing.Primitives.dll => 0x3dc84a49 => 36
	i32 1044663988, ; 159: System.Linq.Expressions.dll => 0x3e444eb4 => 59
	i32 1052210849, ; 160: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 287
	i32 1067277123, ; 161: Syncfusion.Blazor.DataForm.dll => 0x3f9d5b43 => 229
	i32 1067306892, ; 162: GoogleGson => 0x3f9dcf8c => 177
	i32 1082857460, ; 163: System.ComponentModel.TypeConverter => 0x408b17f4 => 19
	i32 1084122840, ; 164: Xamarin.Kotlin.StdLib => 0x409e66d8 => 321
	i32 1098259244, ; 165: System => 0x41761b2c => 165
	i32 1106973742, ; 166: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 199
	i32 1118262833, ; 167: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 343
	i32 1121599056, ; 168: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 286
	i32 1127624469, ; 169: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 214
	i32 1134451860, ; 170: ar\SafeOpsBlazor.resources => 0x439e5c94 => 1
	i32 1135815421, ; 171: Microsoft.AspNetCore.Cryptography.KeyDerivation.dll => 0x43b32afd => 187
	i32 1149092582, ; 172: Xamarin.AndroidX.Window => 0x447dc2e6 => 313
	i32 1157931901, ; 173: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 192
	i32 1168523401, ; 174: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 349
	i32 1170634674, ; 175: System.Web.dll => 0x45c677b2 => 154
	i32 1173126369, ; 176: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 203
	i32 1175144683, ; 177: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 309
	i32 1178241025, ; 178: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 294
	i32 1202000627, ; 179: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 192
	i32 1203215381, ; 180: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 347
	i32 1204270330, ; 181: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 255
	i32 1204575371, ; 182: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 195
	i32 1208641965, ; 183: System.Diagnostics.Process => 0x480a69ad => 30
	i32 1219128291, ; 184: System.IO.IsolatedStorage => 0x48aa6be3 => 53
	i32 1234928153, ; 185: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 345
	i32 1243108478, ; 186: Syncfusion.Blazor.Notifications => 0x4a18547e => 235
	i32 1243150071, ; 187: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 314
	i32 1253011324, ; 188: Microsoft.Win32.Registry => 0x4aaf6f7c => 7
	i32 1260983243, ; 189: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 329
	i32 1264511973, ; 190: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 304
	i32 1267360935, ; 191: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 308
	i32 1273260888, ; 192: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 260
	i32 1275534314, ; 193: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 325
	i32 1278448581, ; 194: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 252
	i32 1293217323, ; 195: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 271
	i32 1309188875, ; 196: System.Private.DataContractSerialization => 0x4e08a30b => 86
	i32 1322716291, ; 197: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 313
	i32 1324164729, ; 198: System.Linq => 0x4eed2679 => 62
	i32 1335329327, ; 199: System.Runtime.Serialization.Json.dll => 0x4f97822f => 113
	i32 1347751866, ; 200: Plugin.Maui.Audio => 0x50550fba => 224
	i32 1364015309, ; 201: System.IO => 0x514d38cd => 58
	i32 1373134921, ; 202: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 359
	i32 1376866003, ; 203: Xamarin.AndroidX.SavedState => 0x52114ed3 => 300
	i32 1379779777, ; 204: System.Resources.ResourceManager => 0x523dc4c1 => 100
	i32 1384052088, ; 205: Syncfusion.Blazor.Core => 0x527ef578 => 227
	i32 1402170036, ; 206: System.Configuration.dll => 0x53936ab4 => 21
	i32 1406073936, ; 207: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 264
	i32 1408764838, ; 208: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 112
	i32 1411638395, ; 209: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 102
	i32 1422545099, ; 210: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 103
	i32 1430672901, ; 211: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 327
	i32 1434145427, ; 212: System.Runtime.Handles => 0x557b5293 => 105
	i32 1435222561, ; 213: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 317
	i32 1439761251, ; 214: System.Net.Quic.dll => 0x55d10363 => 72
	i32 1452070440, ; 215: System.Formats.Asn1.dll => 0x568cd628 => 39
	i32 1453312822, ; 216: System.Diagnostics.Tools.dll => 0x569fcb36 => 33
	i32 1454105418, ; 217: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 204
	i32 1457743152, ; 218: System.Runtime.Extensions.dll => 0x56e36530 => 104
	i32 1458022317, ; 219: System.Net.Security.dll => 0x56e7a7ad => 74
	i32 1461004990, ; 220: es\Microsoft.Maui.Controls.resources => 0x57152abe => 333
	i32 1461234159, ; 221: System.Collections.Immutable.dll => 0x5718a9ef => 11
	i32 1461719063, ; 222: System.Security.Cryptography.OpenSsl => 0x57201017 => 124
	i32 1462112819, ; 223: System.IO.Compression.dll => 0x57261233 => 47
	i32 1469204771, ; 224: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 254
	i32 1470490898, ; 225: Microsoft.Extensions.Primitives => 0x57a5e912 => 216
	i32 1479771757, ; 226: System.Collections.Immutable => 0x5833866d => 11
	i32 1480492111, ; 227: System.IO.Compression.Brotli.dll => 0x583e844f => 44
	i32 1487239319, ; 228: Microsoft.Win32.Primitives => 0x58a57897 => 6
	i32 1490025113, ; 229: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 301
	i32 1493001747, ; 230: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 337
	i32 1502141782, ; 231: Syncfusion.Blazor.SplitButtons.dll => 0x5988dd56 => 238
	i32 1514721132, ; 232: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 332
	i32 1521091094, ; 233: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 207
	i32 1536373174, ; 234: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 32
	i32 1543031311, ; 235: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 139
	i32 1543355203, ; 236: System.Reflection.Emit.dll => 0x5bfdbb43 => 93
	i32 1546581739, ; 237: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 185
	i32 1550322496, ; 238: System.Reflection.Extensions.dll => 0x5c680b40 => 94
	i32 1551623176, ; 239: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 352
	i32 1565862583, ; 240: System.IO.FileSystem.Primitives => 0x5d552ab7 => 50
	i32 1566207040, ; 241: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 142
	i32 1572293168, ; 242: Syncfusion.ExcelExport.Net.dll => 0x5db74a30 => 240
	i32 1573704789, ; 243: System.Runtime.Serialization.Json => 0x5dccd455 => 113
	i32 1580037396, ; 244: System.Threading.Overlapped => 0x5e2d7514 => 141
	i32 1582372066, ; 245: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 270
	i32 1592978981, ; 246: System.Runtime.Serialization.dll => 0x5ef2ee25 => 116
	i32 1597949149, ; 247: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 318
	i32 1601112923, ; 248: System.Xml.Serialization => 0x5f6f0b5b => 158
	i32 1604827217, ; 249: System.Net.WebClient => 0x5fa7b851 => 77
	i32 1618516317, ; 250: System.Net.WebSockets.Client.dll => 0x6078995d => 80
	i32 1622152042, ; 251: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 290
	i32 1622358360, ; 252: System.Dynamic.Runtime => 0x60b33958 => 38
	i32 1624863272, ; 253: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 312
	i32 1632842087, ; 254: Microsoft.Extensions.Configuration.Json => 0x61533167 => 200
	i32 1634654947, ; 255: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 176
	i32 1635184631, ; 256: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 274
	i32 1636350590, ; 257: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 267
	i32 1638839988, ; 258: Microsoft.AspNetCore.Components.QuickGrid.dll => 0x61aeb6b4 => 182
	i32 1639515021, ; 259: System.Net.Http.dll => 0x61b9038d => 65
	i32 1639986890, ; 260: System.Text.RegularExpressions => 0x61c036ca => 139
	i32 1641389582, ; 261: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 17
	i32 1654881142, ; 262: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 184
	i32 1657153582, ; 263: System.Runtime => 0x62c6282e => 117
	i32 1658241508, ; 264: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 306
	i32 1658251792, ; 265: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 315
	i32 1670060433, ; 266: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 262
	i32 1675553242, ; 267: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 49
	i32 1677501392, ; 268: System.Net.Primitives.dll => 0x63fca3d0 => 71
	i32 1678508291, ; 269: System.Net.WebSockets => 0x640c0103 => 81
	i32 1679769178, ; 270: System.Security.Cryptography => 0x641f3e5a => 127
	i32 1689493916, ; 271: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 191
	i32 1691477237, ; 272: System.Reflection.Metadata => 0x64d1e4f5 => 95
	i32 1696967625, ; 273: System.Security.Cryptography.Csp => 0x6525abc9 => 122
	i32 1698840827, ; 274: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 322
	i32 1701541528, ; 275: System.Diagnostics.Debug.dll => 0x656b7698 => 28
	i32 1720223769, ; 276: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 283
	i32 1726116996, ; 277: System.Reflection.dll => 0x66e27484 => 98
	i32 1728033016, ; 278: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 29
	i32 1729485958, ; 279: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 258
	i32 1736233607, ; 280: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 350
	i32 1743415430, ; 281: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 328
	i32 1744735666, ; 282: System.Transactions.Local.dll => 0x67fe8db2 => 150
	i32 1746115085, ; 283: System.IO.Pipelines.dll => 0x68139a0d => 243
	i32 1746316138, ; 284: Mono.Android.Export => 0x6816ab6a => 170
	i32 1750313021, ; 285: Microsoft.Win32.Primitives.dll => 0x6853a83d => 6
	i32 1758240030, ; 286: System.Resources.Reader.dll => 0x68cc9d1e => 99
	i32 1760259689, ; 287: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 183
	i32 1763938596, ; 288: System.Diagnostics.TraceSource.dll => 0x69239124 => 34
	i32 1765942094, ; 289: System.Reflection.Extensions => 0x6942234e => 94
	i32 1766324549, ; 290: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 305
	i32 1770582343, ; 291: Microsoft.Extensions.Logging.dll => 0x6988f147 => 212
	i32 1776026572, ; 292: System.Core.dll => 0x69dc03cc => 23
	i32 1777075843, ; 293: System.Globalization.Extensions.dll => 0x69ec0683 => 42
	i32 1780572499, ; 294: Mono.Android.Runtime.dll => 0x6a216153 => 171
	i32 1782862114, ; 295: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 344
	i32 1788241197, ; 296: Xamarin.AndroidX.Fragment => 0x6a96652d => 276
	i32 1788562814, ; 297: Syncfusion.Blazor.Core.dll => 0x6a9b4d7e => 227
	i32 1793755602, ; 298: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 336
	i32 1808609942, ; 299: Xamarin.AndroidX.Loader => 0x6bcd3296 => 290
	i32 1813058853, ; 300: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 321
	i32 1813201214, ; 301: Xamarin.Google.Android.Material => 0x6c13413e => 315
	i32 1818569960, ; 302: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 295
	i32 1818787751, ; 303: Microsoft.VisualBasic.Core => 0x6c687fa7 => 4
	i32 1819327070, ; 304: Microsoft.AspNetCore.Http.Features.dll => 0x6c70ba5e => 188
	i32 1820883333, ; 305: Microsoft.AspNetCore.Cryptography.Internal.dll => 0x6c887985 => 186
	i32 1824175904, ; 306: System.Text.Encoding.Extensions => 0x6cbab720 => 135
	i32 1824722060, ; 307: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 112
	i32 1828688058, ; 308: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 213
	i32 1842015223, ; 309: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 356
	i32 1847515442, ; 310: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 245
	i32 1853025655, ; 311: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 353
	i32 1858542181, ; 312: System.Linq.Expressions => 0x6ec71a65 => 59
	i32 1870277092, ; 313: System.Reflection.Primitives => 0x6f7a29e4 => 96
	i32 1875935024, ; 314: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 335
	i32 1879696579, ; 315: System.Formats.Tar.dll => 0x7009e4c3 => 40
	i32 1885316902, ; 316: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 256
	i32 1888955245, ; 317: System.Diagnostics.Contracts => 0x70972b6d => 27
	i32 1889954781, ; 318: System.Reflection.Metadata.dll => 0x70a66bdd => 95
	i32 1895982436, ; 319: Syncfusion.Blazor.Inputs => 0x71026564 => 232
	i32 1898237753, ; 320: System.Reflection.DispatchProxy => 0x7124cf39 => 90
	i32 1900610850, ; 321: System.Resources.ResourceManager.dll => 0x71490522 => 100
	i32 1910275211, ; 322: System.Collections.NonGeneric.dll => 0x71dc7c8b => 12
	i32 1919642331, ; 323: Syncfusion.Blazor.Notifications.dll => 0x726b6adb => 235
	i32 1939592360, ; 324: System.Private.Xml.Linq => 0x739bd4a8 => 88
	i32 1956758971, ; 325: System.Resources.Writer => 0x74a1c5bb => 101
	i32 1961813231, ; 326: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 302
	i32 1968388702, ; 327: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 196
	i32 1983156543, ; 328: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 322
	i32 1983883392, ; 329: Syncfusion.Blazor.DataForm => 0x763fa880 => 229
	i32 1985761444, ; 330: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 247
	i32 1991044029, ; 331: Microsoft.Extensions.Identity.Core.dll => 0x76acebbd => 208
	i32 1991196148, ; 332: Microsoft.AspNetCore.Identity.EntityFrameworkCore.dll => 0x76af3df4 => 189
	i32 2003115576, ; 333: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 332
	i32 2011961780, ; 334: System.Buffers.dll => 0x77ec19b4 => 9
	i32 2019465201, ; 335: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 287
	i32 2025202353, ; 336: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 327
	i32 2031763787, ; 337: Xamarin.Android.Glide => 0x791a414b => 244
	i32 2045470958, ; 338: System.Private.Xml => 0x79eb68ee => 89
	i32 2048278909, ; 339: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 198
	i32 2055257422, ; 340: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 282
	i32 2060060697, ; 341: System.Windows.dll => 0x7aca0819 => 155
	i32 2066184531, ; 342: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 331
	i32 2070888862, ; 343: System.Diagnostics.TraceSource => 0x7b6f419e => 34
	i32 2072397586, ; 344: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 206
	i32 2079903147, ; 345: System.Runtime.dll => 0x7bf8cdab => 117
	i32 2090596640, ; 346: System.Numerics.Vectors => 0x7c9bf920 => 83
	i32 2127167465, ; 347: System.Console => 0x7ec9ffe9 => 22
	i32 2142473426, ; 348: System.Collections.Specialized => 0x7fb38cd2 => 13
	i32 2143790110, ; 349: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 163
	i32 2146852085, ; 350: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 5
	i32 2159891885, ; 351: Microsoft.Maui => 0x80bd55ad => 221
	i32 2169148018, ; 352: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 339
	i32 2181898931, ; 353: Microsoft.Extensions.Options.dll => 0x820d22b3 => 215
	i32 2192057212, ; 354: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 213
	i32 2192166651, ; 355: Microsoft.AspNetCore.Components.Authorization.dll => 0x82a9cefb => 180
	i32 2193016926, ; 356: System.ObjectModel.dll => 0x82b6c85e => 85
	i32 2201107256, ; 357: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 326
	i32 2201231467, ; 358: System.Net.Http => 0x8334206b => 65
	i32 2207618523, ; 359: it\Microsoft.Maui.Controls.resources => 0x839595db => 341
	i32 2217644978, ; 360: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 309
	i32 2222056684, ; 361: System.Threading.Tasks.Parallel => 0x8471e4ec => 144
	i32 2238417588, ; 362: Syncfusion.Blazor.DropDowns => 0x856b8ab4 => 230
	i32 2244775296, ; 363: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 291
	i32 2252106437, ; 364: System.Xml.Serialization.dll => 0x863c6ac5 => 158
	i32 2252897993, ; 365: Microsoft.EntityFrameworkCore => 0x86487ec9 => 191
	i32 2256313426, ; 366: System.Globalization.Extensions => 0x867c9c52 => 42
	i32 2265110946, ; 367: System.Security.AccessControl.dll => 0x8702d9a2 => 118
	i32 2266799131, ; 368: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 197
	i32 2267999099, ; 369: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 246
	i32 2270573516, ; 370: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 335
	i32 2274912384, ; 371: Microsoft.Extensions.Identity.Stores => 0x87986880 => 209
	i32 2279755925, ; 372: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 298
	i32 2293034957, ; 373: System.ServiceModel.Web.dll => 0x88acefcd => 132
	i32 2295906218, ; 374: System.Net.Sockets => 0x88d8bfaa => 76
	i32 2298471582, ; 375: System.Net.Mail => 0x88ffe49e => 67
	i32 2303942373, ; 376: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 345
	i32 2305521784, ; 377: System.Private.CoreLib.dll => 0x896b7878 => 173
	i32 2315684594, ; 378: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 250
	i32 2320631194, ; 379: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 144
	i32 2340441535, ; 380: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 107
	i32 2344264397, ; 381: System.ValueTuple => 0x8bbaa2cd => 152
	i32 2353062107, ; 382: System.Net.Primitives => 0x8c40e0db => 71
	i32 2353068140, ; 383: Syncfusion.Blazor.Lists.dll => 0x8c40f86c => 233
	i32 2368005991, ; 384: System.Xml.ReaderWriter.dll => 0x8d24e767 => 157
	i32 2371007202, ; 385: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 196
	i32 2378619854, ; 386: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 122
	i32 2383496789, ; 387: System.Security.Principal.Windows.dll => 0x8e114655 => 128
	i32 2395872292, ; 388: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 340
	i32 2401565422, ; 389: System.Web.HttpUtility => 0x8f24faee => 153
	i32 2403452196, ; 390: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 273
	i32 2406371028, ; 391: Microsoft.Extensions.Identity.Stores.dll => 0x8f6e4ed4 => 209
	i32 2411328690, ; 392: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 179
	i32 2421380589, ; 393: System.Threading.Tasks.Dataflow => 0x905355ed => 142
	i32 2423080555, ; 394: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 260
	i32 2427813419, ; 395: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 337
	i32 2431056637, ; 396: SafeOpsBlazor => 0x90e6fafd => 2
	i32 2435356389, ; 397: System.Console.dll => 0x912896e5 => 22
	i32 2435904999, ; 398: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 16
	i32 2442556106, ; 399: Microsoft.JSInterop.dll => 0x919672ca => 217
	i32 2454642406, ; 400: System.Text.Encoding.dll => 0x924edee6 => 136
	i32 2458678730, ; 401: System.Net.Sockets.dll => 0x928c75ca => 76
	i32 2459001652, ; 402: System.Linq.Parallel.dll => 0x92916334 => 60
	i32 2465532216, ; 403: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 263
	i32 2471841756, ; 404: netstandard.dll => 0x93554fdc => 168
	i32 2472658475, ; 405: Syncfusion.Blazor.Popups => 0x9361c62b => 236
	i32 2475788418, ; 406: Java.Interop.dll => 0x93918882 => 169
	i32 2480646305, ; 407: Microsoft.Maui.Controls => 0x93dba8a1 => 219
	i32 2483903535, ; 408: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 17
	i32 2484371297, ; 409: System.Net.ServicePoint => 0x94147f61 => 75
	i32 2490993605, ; 410: System.AppContext.dll => 0x94798bc5 => 8
	i32 2501346920, ; 411: System.Data.DataSetExtensions => 0x95178668 => 25
	i32 2505896520, ; 412: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 285
	i32 2522472828, ; 413: Xamarin.Android.Glide.dll => 0x9659e17c => 244
	i32 2533808983, ; 414: Syncfusion.Blazor.Popups.dll => 0x9706db57 => 236
	i32 2537015816, ; 415: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 178
	i32 2538310050, ; 416: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 92
	i32 2550873716, ; 417: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 338
	i32 2562349572, ; 418: Microsoft.CSharp => 0x98ba5a04 => 3
	i32 2570120770, ; 419: System.Text.Encodings.Web => 0x9930ee42 => 137
	i32 2581783588, ; 420: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 286
	i32 2581819634, ; 421: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 308
	i32 2585220780, ; 422: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 135
	i32 2585805581, ; 423: System.Net.Ping => 0x9a20430d => 70
	i32 2585813321, ; 424: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 181
	i32 2589602615, ; 425: System.Threading.ThreadPool => 0x9a5a3337 => 147
	i32 2590755012, ; 426: Syncfusion.Blazor.Grids => 0x9a6bc8c4 => 231
	i32 2592341985, ; 427: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 203
	i32 2593496499, ; 428: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 347
	i32 2605712449, ; 429: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 326
	i32 2615225536, ; 430: Blazored.Typeahead => 0x9be12cc0 => 174
	i32 2615233544, ; 431: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 277
	i32 2616218305, ; 432: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 214
	i32 2617129537, ; 433: System.Private.Xml.dll => 0x9bfe3a41 => 89
	i32 2618712057, ; 434: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 97
	i32 2620871830, ; 435: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 267
	i32 2624644809, ; 436: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 272
	i32 2626831493, ; 437: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 342
	i32 2627185994, ; 438: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 32
	i32 2629843544, ; 439: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 46
	i32 2633051222, ; 440: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 281
	i32 2634653062, ; 441: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 193
	i32 2651809848, ; 442: Syncfusion.Blazor.SplitButtons => 0x9e0f6838 => 238
	i32 2663391936, ; 443: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 246
	i32 2663698177, ; 444: System.Runtime.Loader => 0x9ec4cf01 => 110
	i32 2664396074, ; 445: System.Xml.XDocument.dll => 0x9ecf752a => 159
	i32 2665622720, ; 446: System.Drawing.Primitives => 0x9ee22cc0 => 36
	i32 2676780864, ; 447: System.Data.Common.dll => 0x9f8c6f40 => 24
	i32 2686887180, ; 448: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 115
	i32 2692077919, ; 449: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 184
	i32 2693849962, ; 450: System.IO.dll => 0xa090e36a => 58
	i32 2701096212, ; 451: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 306
	i32 2715334215, ; 452: System.Threading.Tasks.dll => 0xa1d8b647 => 145
	i32 2717744543, ; 453: System.Security.Claims => 0xa1fd7d9f => 119
	i32 2719963679, ; 454: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 121
	i32 2724373263, ; 455: System.Runtime.Numerics.dll => 0xa262a30f => 111
	i32 2732626843, ; 456: Xamarin.AndroidX.Activity => 0xa2e0939b => 248
	i32 2735172069, ; 457: System.Threading.Channels => 0xa30769e5 => 140
	i32 2735631878, ; 458: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 178
	i32 2737747696, ; 459: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 254
	i32 2740948882, ; 460: System.IO.Pipes.AccessControl => 0xa35f8f92 => 55
	i32 2748088231, ; 461: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 106
	i32 2752995522, ; 462: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 348
	i32 2758225723, ; 463: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 220
	i32 2764765095, ; 464: Microsoft.Maui.dll => 0xa4caf7a7 => 221
	i32 2765824710, ; 465: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 134
	i32 2770495804, ; 466: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 320
	i32 2778768386, ; 467: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 311
	i32 2779977773, ; 468: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 299
	i32 2785298383, ; 469: ar/SafeOpsBlazor.resources.dll => 0xa60447cf => 1
	i32 2785988530, ; 470: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 354
	i32 2788224221, ; 471: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 277
	i32 2801831435, ; 472: Microsoft.Maui.Graphics => 0xa7008e0b => 223
	i32 2803228030, ; 473: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 160
	i32 2806116107, ; 474: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 333
	i32 2810250172, ; 475: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 264
	i32 2819470561, ; 476: System.Xml.dll => 0xa80db4e1 => 164
	i32 2821205001, ; 477: System.ServiceProcess.dll => 0xa8282c09 => 133
	i32 2821294376, ; 478: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 299
	i32 2824502124, ; 479: System.Xml.XmlDocument => 0xa85a7b6c => 162
	i32 2831556043, ; 480: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 346
	i32 2833784645, ; 481: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 190
	i32 2838993487, ; 482: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 288
	i32 2847789619, ; 483: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 193
	i32 2849599387, ; 484: System.Threading.Overlapped.dll => 0xa9d96f9b => 141
	i32 2850549256, ; 485: Microsoft.AspNetCore.Http.Features => 0xa9e7ee08 => 188
	i32 2851284298, ; 486: Syncfusion.Blazor.Navigations.dll => 0xa9f3254a => 234
	i32 2853208004, ; 487: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 311
	i32 2855708567, ; 488: Xamarin.AndroidX.Transition => 0xaa36a797 => 307
	i32 2858631995, ; 489: AuthShared.dll => 0xaa63433b => 361
	i32 2861098320, ; 490: Mono.Android.Export.dll => 0xaa88e550 => 170
	i32 2861189240, ; 491: Microsoft.Maui.Essentials => 0xaa8a4878 => 222
	i32 2868488919, ; 492: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 176
	i32 2870099610, ; 493: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 249
	i32 2874859004, ; 494: ar\AuthShared.resources => 0xab5addfc => 0
	i32 2875164099, ; 495: Jsr305Binding.dll => 0xab5f85c3 => 316
	i32 2875220617, ; 496: System.Globalization.Calendars.dll => 0xab606289 => 41
	i32 2884993177, ; 497: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 275
	i32 2887636118, ; 498: System.Net.dll => 0xac1dd496 => 82
	i32 2892341533, ; 499: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 183
	i32 2899753641, ; 500: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 57
	i32 2900621748, ; 501: System.Dynamic.Runtime.dll => 0xace3f9b4 => 38
	i32 2901442782, ; 502: System.Reflection => 0xacf080de => 98
	i32 2905242038, ; 503: mscorlib.dll => 0xad2a79b6 => 167
	i32 2909740682, ; 504: System.Private.CoreLib => 0xad6f1e8a => 173
	i32 2911054922, ; 505: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 206
	i32 2916838712, ; 506: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 312
	i32 2919462931, ; 507: System.Numerics.Vectors.dll => 0xae037813 => 83
	i32 2920818908, ; 508: Syncfusion.Blazor.Navigations => 0xae1828dc => 234
	i32 2921128767, ; 509: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 251
	i32 2936416060, ; 510: System.Resources.Reader => 0xaf06273c => 99
	i32 2940926066, ; 511: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 31
	i32 2941902126, ; 512: Syncfusion.Blazor.Calendars.dll => 0xaf59dd2e => 226
	i32 2942453041, ; 513: System.Xml.XPath.XDocument => 0xaf624531 => 160
	i32 2959614098, ; 514: System.ComponentModel.dll => 0xb0682092 => 20
	i32 2968338931, ; 515: System.Security.Principal.Windows => 0xb0ed41f3 => 128
	i32 2972252294, ; 516: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 120
	i32 2978675010, ; 517: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 271
	i32 2987532451, ; 518: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 302
	i32 2996846495, ; 519: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 284
	i32 3014607031, ; 520: Microsoft.AspNetCore.Cryptography.KeyDerivation => 0xb3af40b7 => 187
	i32 3016983068, ; 521: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 304
	i32 3023353419, ; 522: WindowsBase.dll => 0xb434b64b => 166
	i32 3024354802, ; 523: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 279
	i32 3038032645, ; 524: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 362
	i32 3056245963, ; 525: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 301
	i32 3057625584, ; 526: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 292
	i32 3059408633, ; 527: Mono.Android.Runtime => 0xb65adef9 => 171
	i32 3059793426, ; 528: System.ComponentModel.Primitives => 0xb660be12 => 18
	i32 3061345367, ; 529: Syncfusion.Blazor.Calendars => 0xb6786c57 => 226
	i32 3069363400, ; 530: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 194
	i32 3075834255, ; 531: System.Threading.Tasks => 0xb755818f => 145
	i32 3077302341, ; 532: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 339
	i32 3090735792, ; 533: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 126
	i32 3099732863, ; 534: System.Security.Claims.dll => 0xb8c22b7f => 119
	i32 3103600923, ; 535: System.Formats.Asn1 => 0xb8fd311b => 39
	i32 3111772706, ; 536: System.Runtime.Serialization => 0xb979e222 => 116
	i32 3121463068, ; 537: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 48
	i32 3124832203, ; 538: System.Threading.Tasks.Extensions => 0xba4127cb => 143
	i32 3132293585, ; 539: System.Security.AccessControl => 0xbab301d1 => 118
	i32 3147165239, ; 540: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 35
	i32 3148237826, ; 541: GoogleGson.dll => 0xbba64c02 => 177
	i32 3159123045, ; 542: System.Reflection.Primitives.dll => 0xbc4c6465 => 96
	i32 3160747431, ; 543: System.IO.MemoryMappedFiles => 0xbc652da7 => 54
	i32 3178803400, ; 544: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 293
	i32 3192346100, ; 545: System.Security.SecureString => 0xbe4755f4 => 130
	i32 3193515020, ; 546: System.Web => 0xbe592c0c => 154
	i32 3195844289, ; 547: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 194
	i32 3201120287, ; 548: Syncfusion.Blazor.Lists => 0xbecd381f => 233
	i32 3204380047, ; 549: System.Data.dll => 0xbefef58f => 26
	i32 3209718065, ; 550: System.Xml.XmlDocument.dll => 0xbf506931 => 162
	i32 3211777861, ; 551: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 270
	i32 3220365878, ; 552: System.Threading => 0xbff2e236 => 149
	i32 3226221578, ; 553: System.Runtime.Handles.dll => 0xc04c3c0a => 105
	i32 3251039220, ; 554: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 90
	i32 3258312781, ; 555: Xamarin.AndroidX.CardView => 0xc235e84d => 258
	i32 3265493905, ; 556: System.Linq.Queryable.dll => 0xc2a37b91 => 61
	i32 3265893370, ; 557: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 143
	i32 3277815716, ; 558: System.Resources.Writer.dll => 0xc35f7fa4 => 101
	i32 3279906254, ; 559: Microsoft.Win32.Registry.dll => 0xc37f65ce => 7
	i32 3280506390, ; 560: System.ComponentModel.Annotations.dll => 0xc3888e16 => 15
	i32 3290767353, ; 561: System.Security.Cryptography.Encoding => 0xc4251ff9 => 123
	i32 3299363146, ; 562: System.Text.Encoding => 0xc4a8494a => 136
	i32 3303498502, ; 563: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 29
	i32 3305363605, ; 564: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 334
	i32 3316684772, ; 565: System.Net.Requests.dll => 0xc5b097e4 => 73
	i32 3317135071, ; 566: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 268
	i32 3317144872, ; 567: System.Data => 0xc5b79d28 => 26
	i32 3340431453, ; 568: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 256
	i32 3345895724, ; 569: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 297
	i32 3346324047, ; 570: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 294
	i32 3357674450, ; 571: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 351
	i32 3358260929, ; 572: System.Text.Json => 0xc82afec1 => 138
	i32 3362336904, ; 573: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 249
	i32 3362522851, ; 574: Xamarin.AndroidX.Core => 0xc86c06e3 => 265
	i32 3366347497, ; 575: Java.Interop => 0xc8a662e9 => 169
	i32 3374999561, ; 576: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 298
	i32 3381016424, ; 577: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 330
	i32 3395150330, ; 578: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 102
	i32 3403906625, ; 579: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 124
	i32 3405233483, ; 580: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 269
	i32 3406629867, ; 581: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 204
	i32 3421170118, ; 582: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 198
	i32 3428513518, ; 583: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 201
	i32 3429136800, ; 584: System.Xml => 0xcc6479a0 => 164
	i32 3430777524, ; 585: netstandard => 0xcc7d82b4 => 168
	i32 3441283291, ; 586: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 272
	i32 3445260447, ; 587: System.Formats.Tar => 0xcd5a809f => 40
	i32 3452344032, ; 588: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 218
	i32 3463511458, ; 589: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 338
	i32 3464190856, ; 590: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 181
	i32 3471940407, ; 591: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 19
	i32 3476120550, ; 592: Mono.Android => 0xcf3163e6 => 172
	i32 3479583265, ; 593: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 351
	i32 3484440000, ; 594: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 350
	i32 3485117614, ; 595: System.Text.Json.dll => 0xcfbaacae => 138
	i32 3486566296, ; 596: System.Transactions => 0xcfd0c798 => 151
	i32 3493954962, ; 597: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 261
	i32 3500000672, ; 598: Microsoft.JSInterop => 0xd09dc5a0 => 217
	i32 3509114376, ; 599: System.Xml.Linq => 0xd128d608 => 156
	i32 3515174580, ; 600: System.Security.dll => 0xd1854eb4 => 131
	i32 3517728004, ; 601: Syncfusion.Blazor.Themes => 0xd1ac4504 => 239
	i32 3530912306, ; 602: System.Configuration => 0xd2757232 => 21
	i32 3539954161, ; 603: System.Net.HttpListener => 0xd2ff69f1 => 66
	i32 3560100363, ; 604: System.Threading.Timer => 0xd432d20b => 148
	i32 3570554715, ; 605: System.IO.FileSystem.AccessControl => 0xd4d2575b => 48
	i32 3580758918, ; 606: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 358
	i32 3592435036, ; 607: Microsoft.Extensions.Localization.Abstractions => 0xd620355c => 211
	i32 3597029428, ; 608: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 247
	i32 3598340787, ; 609: System.Net.WebSockets.Client => 0xd67a52b3 => 80
	i32 3608519521, ; 610: System.Linq.dll => 0xd715a361 => 62
	i32 3619374377, ; 611: Microsoft.Extensions.Identity.Core => 0xd7bb4529 => 208
	i32 3624195450, ; 612: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 107
	i32 3627220390, ; 613: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 296
	i32 3633644679, ; 614: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 251
	i32 3634693993, ; 615: Syncfusion.Blazor.Spinner.dll => 0xd8a50769 => 237
	i32 3638274909, ; 616: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 50
	i32 3641597786, ; 617: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 282
	i32 3643446276, ; 618: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 355
	i32 3643854240, ; 619: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 293
	i32 3645089577, ; 620: System.ComponentModel.DataAnnotations => 0xd943a729 => 16
	i32 3646522361, ; 621: Syncfusion.Blazor.Grids.dll => 0xd95983f9 => 231
	i32 3657292374, ; 622: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 197
	i32 3660523487, ; 623: System.Net.NetworkInformation => 0xda2f27df => 69
	i32 3660726404, ; 624: Plugin.Maui.Audio.dll => 0xda324084 => 224
	i32 3672681054, ; 625: Mono.Android.dll => 0xdae8aa5e => 172
	i32 3675390461, ; 626: Syncfusion.Blazor.Buttons => 0xdb1201fd => 225
	i32 3682565725, ; 627: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 257
	i32 3684561358, ; 628: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 261
	i32 3697841164, ; 629: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 360
	i32 3700866549, ; 630: System.Net.WebProxy.dll => 0xdc96bdf5 => 79
	i32 3706696989, ; 631: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 266
	i32 3716563718, ; 632: System.Runtime.Intrinsics => 0xdd864306 => 109
	i32 3718780102, ; 633: Xamarin.AndroidX.Annotation => 0xdda814c6 => 250
	i32 3719388979, ; 634: Syncfusion.Blazor.Buttons.dll => 0xddb15f33 => 225
	i32 3721167343, ; 635: Syncfusion.Blazor.Data.dll => 0xddcc81ef => 228
	i32 3722202641, ; 636: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 200
	i32 3724971120, ; 637: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 292
	i32 3732100267, ; 638: System.Net.NameResolution => 0xde7354ab => 68
	i32 3732214720, ; 639: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 190
	i32 3733477641, ; 640: Syncfusion.PdfExport.Net.dll => 0xde885909 => 241
	i32 3737834244, ; 641: System.Net.Http.Json.dll => 0xdecad304 => 64
	i32 3748608112, ; 642: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 242
	i32 3751444290, ; 643: System.Xml.XPath => 0xdf9a7f42 => 161
	i32 3758424670, ; 644: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 199
	i32 3761373394, ; 645: Blazored.Typeahead.dll => 0xe03200d2 => 174
	i32 3776403777, ; 646: Microsoft.Extensions.Localization.Abstractions.dll => 0xe1175941 => 211
	i32 3786282454, ; 647: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 259
	i32 3792276235, ; 648: System.Collections.NonGeneric => 0xe2098b0b => 12
	i32 3800979733, ; 649: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 218
	i32 3802395368, ; 650: System.Collections.Specialized.dll => 0xe2a3f2e8 => 13
	i32 3817368567, ; 651: CommunityToolkit.Maui.dll => 0xe3886bf7 => 175
	i32 3819260425, ; 652: System.Net.WebProxy => 0xe3a54a09 => 79
	i32 3823082795, ; 653: System.Security.Cryptography.dll => 0xe3df9d2b => 127
	i32 3829621856, ; 654: System.Numerics.dll => 0xe4436460 => 84
	i32 3838418290, ; 655: ar/AuthShared.resources.dll => 0xe4c99d72 => 0
	i32 3841636137, ; 656: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 202
	i32 3844307129, ; 657: System.Net.Mail.dll => 0xe52378b9 => 67
	i32 3849253459, ; 658: System.Runtime.InteropServices.dll => 0xe56ef253 => 108
	i32 3868024793, ; 659: AuthShared => 0xe68d5fd9 => 361
	i32 3870376305, ; 660: System.Net.HttpListener.dll => 0xe6b14171 => 66
	i32 3873536506, ; 661: System.Security.Principal => 0xe6e179fa => 129
	i32 3875112723, ; 662: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 123
	i32 3885497537, ; 663: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 78
	i32 3885922214, ; 664: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 307
	i32 3888767677, ; 665: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 297
	i32 3889960447, ; 666: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 359
	i32 3893143201, ; 667: Microsoft.AspNetCore.Identity.EntityFrameworkCore => 0xe80ca6a1 => 189
	i32 3896106733, ; 668: System.Collections.Concurrent.dll => 0xe839deed => 10
	i32 3896760992, ; 669: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 265
	i32 3898971068, ; 670: Microsoft.Extensions.Localization.dll => 0xe86593bc => 210
	i32 3900550681, ; 671: Syncfusion.Blazor.Inputs.dll => 0xe87dae19 => 232
	i32 3901907137, ; 672: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 4
	i32 3920810846, ; 673: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 45
	i32 3921031405, ; 674: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 310
	i32 3928044579, ; 675: System.Xml.ReaderWriter => 0xea213423 => 157
	i32 3930554604, ; 676: System.Security.Principal.dll => 0xea4780ec => 129
	i32 3931092270, ; 677: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 295
	i32 3945713374, ; 678: System.Data.DataSetExtensions.dll => 0xeb2ecede => 25
	i32 3953953790, ; 679: System.Text.Encoding.CodePages => 0xebac8bfe => 134
	i32 3954195687, ; 680: Microsoft.Extensions.Localization => 0xebb03ce7 => 210
	i32 3955647286, ; 681: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 253
	i32 3959773229, ; 682: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 284
	i32 3980434154, ; 683: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 354
	i32 3987592930, ; 684: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 336
	i32 4003436829, ; 685: System.Diagnostics.Process.dll => 0xee9f991d => 30
	i32 4015948917, ; 686: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 252
	i32 4023392905, ; 687: System.IO.Pipelines => 0xefd01a89 => 243
	i32 4025784931, ; 688: System.Memory => 0xeff49a63 => 63
	i32 4046471985, ; 689: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 220
	i32 4054681211, ; 690: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 91
	i32 4068434129, ; 691: System.Private.Xml.Linq.dll => 0xf27f60d1 => 88
	i32 4073602200, ; 692: System.Threading.dll => 0xf2ce3c98 => 149
	i32 4094352644, ; 693: Microsoft.Maui.Essentials.dll => 0xf40add04 => 222
	i32 4099507663, ; 694: System.Drawing.dll => 0xf45985cf => 37
	i32 4100113165, ; 695: System.Private.Uri => 0xf462c30d => 87
	i32 4101593132, ; 696: Xamarin.AndroidX.Emoji2 => 0xf479582c => 273
	i32 4101842092, ; 697: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 195
	i32 4102112229, ; 698: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 349
	i32 4109590703, ; 699: Syncfusion.Blazor.Spinner => 0xf4f360af => 237
	i32 4116013827, ; 700: Microsoft.AspNetCore.Components.QuickGrid => 0xf5556303 => 182
	i32 4125707920, ; 701: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 344
	i32 4126470640, ; 702: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 201
	i32 4127667938, ; 703: System.IO.FileSystem.Watcher => 0xf60736e2 => 51
	i32 4130442656, ; 704: System.AppContext => 0xf6318da0 => 8
	i32 4147896353, ; 705: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 91
	i32 4150914736, ; 706: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 356
	i32 4151237749, ; 707: System.Core => 0xf76edc75 => 23
	i32 4157215678, ; 708: Syncfusion.Blazor.Themes.dll => 0xf7ca13be => 239
	i32 4159265925, ; 709: System.Xml.XmlSerializer => 0xf7e95c85 => 163
	i32 4161255271, ; 710: System.Reflection.TypeExtensions => 0xf807b767 => 97
	i32 4164802419, ; 711: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 51
	i32 4181436372, ; 712: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 114
	i32 4182413190, ; 713: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 289
	i32 4185676441, ; 714: System.Security => 0xf97c5a99 => 131
	i32 4196529839, ; 715: System.Net.WebClient.dll => 0xfa21f6af => 77
	i32 4213026141, ; 716: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 242
	i32 4256097574, ; 717: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 266
	i32 4258378803, ; 718: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 288
	i32 4260525087, ; 719: System.Buffers => 0xfdf2741f => 9
	i32 4265684139, ; 720: Syncfusion.PdfExport.Net => 0xfe412cab => 241
	i32 4271975918, ; 721: Microsoft.Maui.Controls.dll => 0xfea12dee => 219
	i32 4274976490, ; 722: System.Runtime.Numerics => 0xfecef6ea => 111
	i32 4292120959, ; 723: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 289
	i32 4294648842, ; 724: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 205
	i32 4294763496 ; 725: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 275
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [726 x i32] [
	i32 69, ; 0
	i32 68, ; 1
	i32 109, ; 2
	i32 285, ; 3
	i32 319, ; 4
	i32 49, ; 5
	i32 81, ; 6
	i32 146, ; 7
	i32 31, ; 8
	i32 360, ; 9
	i32 125, ; 10
	i32 223, ; 11
	i32 103, ; 12
	i32 186, ; 13
	i32 303, ; 14
	i32 108, ; 15
	i32 303, ; 16
	i32 140, ; 17
	i32 323, ; 18
	i32 78, ; 19
	i32 125, ; 20
	i32 15, ; 21
	i32 259, ; 22
	i32 133, ; 23
	i32 305, ; 24
	i32 152, ; 25
	i32 357, ; 26
	i32 358, ; 27
	i32 228, ; 28
	i32 230, ; 29
	i32 20, ; 30
	i32 257, ; 31
	i32 28, ; 32
	i32 279, ; 33
	i32 3, ; 34
	i32 60, ; 35
	i32 43, ; 36
	i32 2, ; 37
	i32 180, ; 38
	i32 92, ; 39
	i32 179, ; 40
	i32 262, ; 41
	i32 148, ; 42
	i32 281, ; 43
	i32 278, ; 44
	i32 329, ; 45
	i32 55, ; 46
	i32 70, ; 47
	i32 357, ; 48
	i32 248, ; 49
	i32 84, ; 50
	i32 342, ; 51
	i32 280, ; 52
	i32 341, ; 53
	i32 132, ; 54
	i32 56, ; 55
	i32 150, ; 56
	i32 75, ; 57
	i32 146, ; 58
	i32 63, ; 59
	i32 147, ; 60
	i32 362, ; 61
	i32 166, ; 62
	i32 353, ; 63
	i32 263, ; 64
	i32 14, ; 65
	i32 276, ; 66
	i32 126, ; 67
	i32 153, ; 68
	i32 114, ; 69
	i32 167, ; 70
	i32 165, ; 71
	i32 278, ; 72
	i32 291, ; 73
	i32 85, ; 74
	i32 340, ; 75
	i32 334, ; 76
	i32 216, ; 77
	i32 151, ; 78
	i32 323, ; 79
	i32 61, ; 80
	i32 212, ; 81
	i32 52, ; 82
	i32 104, ; 83
	i32 115, ; 84
	i32 41, ; 85
	i32 316, ; 86
	i32 314, ; 87
	i32 205, ; 88
	i32 121, ; 89
	i32 348, ; 90
	i32 175, ; 91
	i32 53, ; 92
	i32 45, ; 93
	i32 120, ; 94
	i32 268, ; 95
	i32 346, ; 96
	i32 274, ; 97
	i32 82, ; 98
	i32 137, ; 99
	i32 310, ; 100
	i32 255, ; 101
	i32 10, ; 102
	i32 74, ; 103
	i32 240, ; 104
	i32 328, ; 105
	i32 156, ; 106
	i32 325, ; 107
	i32 155, ; 108
	i32 93, ; 109
	i32 320, ; 110
	i32 46, ; 111
	i32 343, ; 112
	i32 331, ; 113
	i32 324, ; 114
	i32 110, ; 115
	i32 130, ; 116
	i32 27, ; 117
	i32 245, ; 118
	i32 73, ; 119
	i32 56, ; 120
	i32 47, ; 121
	i32 352, ; 122
	i32 215, ; 123
	i32 269, ; 124
	i32 185, ; 125
	i32 24, ; 126
	i32 283, ; 127
	i32 87, ; 128
	i32 44, ; 129
	i32 161, ; 130
	i32 72, ; 131
	i32 296, ; 132
	i32 5, ; 133
	i32 43, ; 134
	i32 64, ; 135
	i32 18, ; 136
	i32 54, ; 137
	i32 355, ; 138
	i32 319, ; 139
	i32 106, ; 140
	i32 324, ; 141
	i32 317, ; 142
	i32 280, ; 143
	i32 35, ; 144
	i32 159, ; 145
	i32 86, ; 146
	i32 33, ; 147
	i32 14, ; 148
	i32 52, ; 149
	i32 207, ; 150
	i32 57, ; 151
	i32 300, ; 152
	i32 37, ; 153
	i32 202, ; 154
	i32 330, ; 155
	i32 318, ; 156
	i32 253, ; 157
	i32 36, ; 158
	i32 59, ; 159
	i32 287, ; 160
	i32 229, ; 161
	i32 177, ; 162
	i32 19, ; 163
	i32 321, ; 164
	i32 165, ; 165
	i32 199, ; 166
	i32 343, ; 167
	i32 286, ; 168
	i32 214, ; 169
	i32 1, ; 170
	i32 187, ; 171
	i32 313, ; 172
	i32 192, ; 173
	i32 349, ; 174
	i32 154, ; 175
	i32 203, ; 176
	i32 309, ; 177
	i32 294, ; 178
	i32 192, ; 179
	i32 347, ; 180
	i32 255, ; 181
	i32 195, ; 182
	i32 30, ; 183
	i32 53, ; 184
	i32 345, ; 185
	i32 235, ; 186
	i32 314, ; 187
	i32 7, ; 188
	i32 329, ; 189
	i32 304, ; 190
	i32 308, ; 191
	i32 260, ; 192
	i32 325, ; 193
	i32 252, ; 194
	i32 271, ; 195
	i32 86, ; 196
	i32 313, ; 197
	i32 62, ; 198
	i32 113, ; 199
	i32 224, ; 200
	i32 58, ; 201
	i32 359, ; 202
	i32 300, ; 203
	i32 100, ; 204
	i32 227, ; 205
	i32 21, ; 206
	i32 264, ; 207
	i32 112, ; 208
	i32 102, ; 209
	i32 103, ; 210
	i32 327, ; 211
	i32 105, ; 212
	i32 317, ; 213
	i32 72, ; 214
	i32 39, ; 215
	i32 33, ; 216
	i32 204, ; 217
	i32 104, ; 218
	i32 74, ; 219
	i32 333, ; 220
	i32 11, ; 221
	i32 124, ; 222
	i32 47, ; 223
	i32 254, ; 224
	i32 216, ; 225
	i32 11, ; 226
	i32 44, ; 227
	i32 6, ; 228
	i32 301, ; 229
	i32 337, ; 230
	i32 238, ; 231
	i32 332, ; 232
	i32 207, ; 233
	i32 32, ; 234
	i32 139, ; 235
	i32 93, ; 236
	i32 185, ; 237
	i32 94, ; 238
	i32 352, ; 239
	i32 50, ; 240
	i32 142, ; 241
	i32 240, ; 242
	i32 113, ; 243
	i32 141, ; 244
	i32 270, ; 245
	i32 116, ; 246
	i32 318, ; 247
	i32 158, ; 248
	i32 77, ; 249
	i32 80, ; 250
	i32 290, ; 251
	i32 38, ; 252
	i32 312, ; 253
	i32 200, ; 254
	i32 176, ; 255
	i32 274, ; 256
	i32 267, ; 257
	i32 182, ; 258
	i32 65, ; 259
	i32 139, ; 260
	i32 17, ; 261
	i32 184, ; 262
	i32 117, ; 263
	i32 306, ; 264
	i32 315, ; 265
	i32 262, ; 266
	i32 49, ; 267
	i32 71, ; 268
	i32 81, ; 269
	i32 127, ; 270
	i32 191, ; 271
	i32 95, ; 272
	i32 122, ; 273
	i32 322, ; 274
	i32 28, ; 275
	i32 283, ; 276
	i32 98, ; 277
	i32 29, ; 278
	i32 258, ; 279
	i32 350, ; 280
	i32 328, ; 281
	i32 150, ; 282
	i32 243, ; 283
	i32 170, ; 284
	i32 6, ; 285
	i32 99, ; 286
	i32 183, ; 287
	i32 34, ; 288
	i32 94, ; 289
	i32 305, ; 290
	i32 212, ; 291
	i32 23, ; 292
	i32 42, ; 293
	i32 171, ; 294
	i32 344, ; 295
	i32 276, ; 296
	i32 227, ; 297
	i32 336, ; 298
	i32 290, ; 299
	i32 321, ; 300
	i32 315, ; 301
	i32 295, ; 302
	i32 4, ; 303
	i32 188, ; 304
	i32 186, ; 305
	i32 135, ; 306
	i32 112, ; 307
	i32 213, ; 308
	i32 356, ; 309
	i32 245, ; 310
	i32 353, ; 311
	i32 59, ; 312
	i32 96, ; 313
	i32 335, ; 314
	i32 40, ; 315
	i32 256, ; 316
	i32 27, ; 317
	i32 95, ; 318
	i32 232, ; 319
	i32 90, ; 320
	i32 100, ; 321
	i32 12, ; 322
	i32 235, ; 323
	i32 88, ; 324
	i32 101, ; 325
	i32 302, ; 326
	i32 196, ; 327
	i32 322, ; 328
	i32 229, ; 329
	i32 247, ; 330
	i32 208, ; 331
	i32 189, ; 332
	i32 332, ; 333
	i32 9, ; 334
	i32 287, ; 335
	i32 327, ; 336
	i32 244, ; 337
	i32 89, ; 338
	i32 198, ; 339
	i32 282, ; 340
	i32 155, ; 341
	i32 331, ; 342
	i32 34, ; 343
	i32 206, ; 344
	i32 117, ; 345
	i32 83, ; 346
	i32 22, ; 347
	i32 13, ; 348
	i32 163, ; 349
	i32 5, ; 350
	i32 221, ; 351
	i32 339, ; 352
	i32 215, ; 353
	i32 213, ; 354
	i32 180, ; 355
	i32 85, ; 356
	i32 326, ; 357
	i32 65, ; 358
	i32 341, ; 359
	i32 309, ; 360
	i32 144, ; 361
	i32 230, ; 362
	i32 291, ; 363
	i32 158, ; 364
	i32 191, ; 365
	i32 42, ; 366
	i32 118, ; 367
	i32 197, ; 368
	i32 246, ; 369
	i32 335, ; 370
	i32 209, ; 371
	i32 298, ; 372
	i32 132, ; 373
	i32 76, ; 374
	i32 67, ; 375
	i32 345, ; 376
	i32 173, ; 377
	i32 250, ; 378
	i32 144, ; 379
	i32 107, ; 380
	i32 152, ; 381
	i32 71, ; 382
	i32 233, ; 383
	i32 157, ; 384
	i32 196, ; 385
	i32 122, ; 386
	i32 128, ; 387
	i32 340, ; 388
	i32 153, ; 389
	i32 273, ; 390
	i32 209, ; 391
	i32 179, ; 392
	i32 142, ; 393
	i32 260, ; 394
	i32 337, ; 395
	i32 2, ; 396
	i32 22, ; 397
	i32 16, ; 398
	i32 217, ; 399
	i32 136, ; 400
	i32 76, ; 401
	i32 60, ; 402
	i32 263, ; 403
	i32 168, ; 404
	i32 236, ; 405
	i32 169, ; 406
	i32 219, ; 407
	i32 17, ; 408
	i32 75, ; 409
	i32 8, ; 410
	i32 25, ; 411
	i32 285, ; 412
	i32 244, ; 413
	i32 236, ; 414
	i32 178, ; 415
	i32 92, ; 416
	i32 338, ; 417
	i32 3, ; 418
	i32 137, ; 419
	i32 286, ; 420
	i32 308, ; 421
	i32 135, ; 422
	i32 70, ; 423
	i32 181, ; 424
	i32 147, ; 425
	i32 231, ; 426
	i32 203, ; 427
	i32 347, ; 428
	i32 326, ; 429
	i32 174, ; 430
	i32 277, ; 431
	i32 214, ; 432
	i32 89, ; 433
	i32 97, ; 434
	i32 267, ; 435
	i32 272, ; 436
	i32 342, ; 437
	i32 32, ; 438
	i32 46, ; 439
	i32 281, ; 440
	i32 193, ; 441
	i32 238, ; 442
	i32 246, ; 443
	i32 110, ; 444
	i32 159, ; 445
	i32 36, ; 446
	i32 24, ; 447
	i32 115, ; 448
	i32 184, ; 449
	i32 58, ; 450
	i32 306, ; 451
	i32 145, ; 452
	i32 119, ; 453
	i32 121, ; 454
	i32 111, ; 455
	i32 248, ; 456
	i32 140, ; 457
	i32 178, ; 458
	i32 254, ; 459
	i32 55, ; 460
	i32 106, ; 461
	i32 348, ; 462
	i32 220, ; 463
	i32 221, ; 464
	i32 134, ; 465
	i32 320, ; 466
	i32 311, ; 467
	i32 299, ; 468
	i32 1, ; 469
	i32 354, ; 470
	i32 277, ; 471
	i32 223, ; 472
	i32 160, ; 473
	i32 333, ; 474
	i32 264, ; 475
	i32 164, ; 476
	i32 133, ; 477
	i32 299, ; 478
	i32 162, ; 479
	i32 346, ; 480
	i32 190, ; 481
	i32 288, ; 482
	i32 193, ; 483
	i32 141, ; 484
	i32 188, ; 485
	i32 234, ; 486
	i32 311, ; 487
	i32 307, ; 488
	i32 361, ; 489
	i32 170, ; 490
	i32 222, ; 491
	i32 176, ; 492
	i32 249, ; 493
	i32 0, ; 494
	i32 316, ; 495
	i32 41, ; 496
	i32 275, ; 497
	i32 82, ; 498
	i32 183, ; 499
	i32 57, ; 500
	i32 38, ; 501
	i32 98, ; 502
	i32 167, ; 503
	i32 173, ; 504
	i32 206, ; 505
	i32 312, ; 506
	i32 83, ; 507
	i32 234, ; 508
	i32 251, ; 509
	i32 99, ; 510
	i32 31, ; 511
	i32 226, ; 512
	i32 160, ; 513
	i32 20, ; 514
	i32 128, ; 515
	i32 120, ; 516
	i32 271, ; 517
	i32 302, ; 518
	i32 284, ; 519
	i32 187, ; 520
	i32 304, ; 521
	i32 166, ; 522
	i32 279, ; 523
	i32 362, ; 524
	i32 301, ; 525
	i32 292, ; 526
	i32 171, ; 527
	i32 18, ; 528
	i32 226, ; 529
	i32 194, ; 530
	i32 145, ; 531
	i32 339, ; 532
	i32 126, ; 533
	i32 119, ; 534
	i32 39, ; 535
	i32 116, ; 536
	i32 48, ; 537
	i32 143, ; 538
	i32 118, ; 539
	i32 35, ; 540
	i32 177, ; 541
	i32 96, ; 542
	i32 54, ; 543
	i32 293, ; 544
	i32 130, ; 545
	i32 154, ; 546
	i32 194, ; 547
	i32 233, ; 548
	i32 26, ; 549
	i32 162, ; 550
	i32 270, ; 551
	i32 149, ; 552
	i32 105, ; 553
	i32 90, ; 554
	i32 258, ; 555
	i32 61, ; 556
	i32 143, ; 557
	i32 101, ; 558
	i32 7, ; 559
	i32 15, ; 560
	i32 123, ; 561
	i32 136, ; 562
	i32 29, ; 563
	i32 334, ; 564
	i32 73, ; 565
	i32 268, ; 566
	i32 26, ; 567
	i32 256, ; 568
	i32 297, ; 569
	i32 294, ; 570
	i32 351, ; 571
	i32 138, ; 572
	i32 249, ; 573
	i32 265, ; 574
	i32 169, ; 575
	i32 298, ; 576
	i32 330, ; 577
	i32 102, ; 578
	i32 124, ; 579
	i32 269, ; 580
	i32 204, ; 581
	i32 198, ; 582
	i32 201, ; 583
	i32 164, ; 584
	i32 168, ; 585
	i32 272, ; 586
	i32 40, ; 587
	i32 218, ; 588
	i32 338, ; 589
	i32 181, ; 590
	i32 19, ; 591
	i32 172, ; 592
	i32 351, ; 593
	i32 350, ; 594
	i32 138, ; 595
	i32 151, ; 596
	i32 261, ; 597
	i32 217, ; 598
	i32 156, ; 599
	i32 131, ; 600
	i32 239, ; 601
	i32 21, ; 602
	i32 66, ; 603
	i32 148, ; 604
	i32 48, ; 605
	i32 358, ; 606
	i32 211, ; 607
	i32 247, ; 608
	i32 80, ; 609
	i32 62, ; 610
	i32 208, ; 611
	i32 107, ; 612
	i32 296, ; 613
	i32 251, ; 614
	i32 237, ; 615
	i32 50, ; 616
	i32 282, ; 617
	i32 355, ; 618
	i32 293, ; 619
	i32 16, ; 620
	i32 231, ; 621
	i32 197, ; 622
	i32 69, ; 623
	i32 224, ; 624
	i32 172, ; 625
	i32 225, ; 626
	i32 257, ; 627
	i32 261, ; 628
	i32 360, ; 629
	i32 79, ; 630
	i32 266, ; 631
	i32 109, ; 632
	i32 250, ; 633
	i32 225, ; 634
	i32 228, ; 635
	i32 200, ; 636
	i32 292, ; 637
	i32 68, ; 638
	i32 190, ; 639
	i32 241, ; 640
	i32 64, ; 641
	i32 242, ; 642
	i32 161, ; 643
	i32 199, ; 644
	i32 174, ; 645
	i32 211, ; 646
	i32 259, ; 647
	i32 12, ; 648
	i32 218, ; 649
	i32 13, ; 650
	i32 175, ; 651
	i32 79, ; 652
	i32 127, ; 653
	i32 84, ; 654
	i32 0, ; 655
	i32 202, ; 656
	i32 67, ; 657
	i32 108, ; 658
	i32 361, ; 659
	i32 66, ; 660
	i32 129, ; 661
	i32 123, ; 662
	i32 78, ; 663
	i32 307, ; 664
	i32 297, ; 665
	i32 359, ; 666
	i32 189, ; 667
	i32 10, ; 668
	i32 265, ; 669
	i32 210, ; 670
	i32 232, ; 671
	i32 4, ; 672
	i32 45, ; 673
	i32 310, ; 674
	i32 157, ; 675
	i32 129, ; 676
	i32 295, ; 677
	i32 25, ; 678
	i32 134, ; 679
	i32 210, ; 680
	i32 253, ; 681
	i32 284, ; 682
	i32 354, ; 683
	i32 336, ; 684
	i32 30, ; 685
	i32 252, ; 686
	i32 243, ; 687
	i32 63, ; 688
	i32 220, ; 689
	i32 91, ; 690
	i32 88, ; 691
	i32 149, ; 692
	i32 222, ; 693
	i32 37, ; 694
	i32 87, ; 695
	i32 273, ; 696
	i32 195, ; 697
	i32 349, ; 698
	i32 237, ; 699
	i32 182, ; 700
	i32 344, ; 701
	i32 201, ; 702
	i32 51, ; 703
	i32 8, ; 704
	i32 91, ; 705
	i32 356, ; 706
	i32 23, ; 707
	i32 239, ; 708
	i32 163, ; 709
	i32 97, ; 710
	i32 51, ; 711
	i32 114, ; 712
	i32 289, ; 713
	i32 131, ; 714
	i32 77, ; 715
	i32 242, ; 716
	i32 266, ; 717
	i32 288, ; 718
	i32 9, ; 719
	i32 241, ; 720
	i32 219, ; 721
	i32 111, ; 722
	i32 289, ; 723
	i32 205, ; 724
	i32 275 ; 725
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

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
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 68175bbe5a39140c642dab294cf184ecf72eece0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
