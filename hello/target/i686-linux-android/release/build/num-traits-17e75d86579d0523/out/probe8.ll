; ModuleID = 'probe8.13bbfdfcfd0ef3d3-cgu.0'
source_filename = "probe8.13bbfdfcfd0ef3d3-cgu.0"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android"

; core::f64::<impl f64>::to_ne_bytes
; Function Attrs: inlinehint uwtable
define internal void @"_ZN4core3f6421_$LT$impl$u20$f64$GT$11to_ne_bytes17h54bd6c143953e199E"(ptr sret([8 x i8]) align 1 %_0, double %self) unnamed_addr #0 {
start:
  %self1 = bitcast double %self to i64
  store i64 %self1, ptr %_0, align 1
  ret void
}

; probe8::probe
; Function Attrs: uwtable
define void @_ZN6probe85probe17h403fff9626a864bdE() unnamed_addr #1 {
start:
  %_1 = alloca [8 x i8], align 1
; call core::f64::<impl f64>::to_ne_bytes
  call void @"_ZN4core3f6421_$LT$impl$u20$f64$GT$11to_ne_bytes17h54bd6c143953e199E"(ptr sret([8 x i8]) align 1 %_1, double 3.140000e+00)
  ret void
}

attributes #0 = { inlinehint uwtable "probe-stack"="inline-asm" "target-cpu"="pentiumpro" "target-features"="+mmx,+sse,+sse2,+sse3,+ssse3" }
attributes #1 = { uwtable "probe-stack"="inline-asm" "target-cpu"="pentiumpro" "target-features"="+mmx,+sse,+sse2,+sse3,+ssse3" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.76.0 (07dca489a 2024-02-04)"}
