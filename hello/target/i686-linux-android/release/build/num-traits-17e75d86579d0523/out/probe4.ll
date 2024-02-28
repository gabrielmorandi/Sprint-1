; ModuleID = 'probe4.d11b10a17e3dbc71-cgu.0'
source_filename = "probe4.d11b10a17e3dbc71-cgu.0"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android"

@alloc_070f122b6501f82f36a0b0b6f135e030 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/07dca489ac2d933c78d3c5158e3f43beefeb02ce/library/core/src/num/mod.rs" }>, align 1
@alloc_d6df43990613b53f983c7b3765b94769 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_070f122b6501f82f36a0b0b6f135e030, [12 x i8] c"K\00\00\00y\04\00\00\05\00\00\00" }>, align 4
@str.0 = internal unnamed_addr constant [25 x i8] c"attempt to divide by zero"

; probe4::probe
; Function Attrs: uwtable
define void @_ZN6probe45probe17h24d7ceb452ba14b4E() unnamed_addr #0 {
start:
  %0 = call i1 @llvm.expect.i1(i1 false, i1 false)
  br i1 %0, label %panic.i, label %"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17h87ab9374775eb120E.exit"

panic.i:                                          ; preds = %start
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17h3c7ddee9d7e1f3bfE(ptr align 1 @str.0, i32 25, ptr align 4 @alloc_d6df43990613b53f983c7b3765b94769) #3
  unreachable

"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17h87ab9374775eb120E.exit": ; preds = %start
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i1 @llvm.expect.i1(i1, i1) #1

; core::panicking::panic
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking5panic17h3c7ddee9d7e1f3bfE(ptr align 1, i32, ptr align 4) unnamed_addr #2

attributes #0 = { uwtable "probe-stack"="inline-asm" "target-cpu"="pentiumpro" "target-features"="+mmx,+sse,+sse2,+sse3,+ssse3" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #2 = { cold noinline noreturn uwtable "probe-stack"="inline-asm" "target-cpu"="pentiumpro" "target-features"="+mmx,+sse,+sse2,+sse3,+ssse3" }
attributes #3 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.76.0 (07dca489a 2024-02-04)"}
