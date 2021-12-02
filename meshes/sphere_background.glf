# Pointwise V18.4R2 Journal file - Wed Nov 10 13:20:06 2021

package require PWI_Glyph 4.18.4

pw::Application setUndoMaximumLevels 5
pw::Application reset
pw::Application markUndoLevel {Journal Reset}

pw::Application clearModified

pw::Application setCAESolver {EXODUS II} 3
pw::Application markUndoLevel {Select Solver}

pw::Application setCAESolver {EXODUS II} 3
pw::Application markUndoLevel {Set Dimension 3D}

# CONTROLS:
# number of points on cube edge
set nc 51
# initial step size for extrusion
set ds 0.005
# growth factor for extrusion
set gf 1.06
# number of extrusion steps
set nsteps 75
# maximum ds for extrusion
set max_ds 0.05
# background mesh spacing near sphere
set dx_background 0.08

set _TMP(mode_1) [pw::Application begin Create]
  set _TMP(PW_1) [pw::GridShape create]
  $_TMP(PW_1) delete
  unset _TMP(PW_1)
  set _TMP(PW_1) [pw::Shape create]
  $_TMP(PW_1) sphere -radius 0.5 -baseAngle 0 -topAngle 180
  
  $_TMP(PW_1) setTransform [list 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1]
  $_TMP(PW_1) setPivot Center
  $_TMP(PW_1) setSectionMinimum 0
  $_TMP(PW_1) setSectionMaximum 360
  $_TMP(PW_1) setSidesType Plane
  $_TMP(PW_1) setBaseType Plane
  $_TMP(PW_1) setTopType Plane
  $_TMP(PW_1) setEnclosingEntities {}
  set _TMP(PW_2) [$_TMP(PW_1) createModels]
  set _DB(1) [pw::DatabaseEntity getByName model-1]
  unset _TMP(PW_2)
  pw::Entity delete $_TMP(PW_1)
  unset _TMP(PW_1)
$_TMP(mode_1) end
unset _TMP(mode_1)
pw::Application markUndoLevel {Create Shape}

set _TMP(mode_1) [pw::Application begin Create]
  set _TMP(PW_1) [pw::Shape create]
  pw::Display resetView -Z
  $_TMP(PW_1) sphere -radius 2 -baseAngle 0 -topAngle 180
  
  $_TMP(PW_1) setTransform [list 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1]
  $_TMP(PW_1) setPivot Center
  $_TMP(PW_1) setSectionMinimum 0
  $_TMP(PW_1) setSectionMaximum 360
  $_TMP(PW_1) setSidesType Plane
  $_TMP(PW_1) setBaseType Plane
  $_TMP(PW_1) setTopType Plane
  $_TMP(PW_1) setEnclosingEntities {}
  set _TMP(PW_2) [$_TMP(PW_1) createModels]
  set _DB(2) [pw::DatabaseEntity getByName model-2]
  unset _TMP(PW_2)
  pw::Entity delete $_TMP(PW_1)
  unset _TMP(PW_1)
$_TMP(mode_1) end
unset _TMP(mode_1)
pw::Application markUndoLevel {Create Shape}

set _TMP(mode_1) [pw::Application begin Create]
  set _TMP(PW_1) [pw::Shape create]
  unset _TMP(PW_1)
$_TMP(mode_1) abort
unset _TMP(mode_1)
pw::Application undo
set _TMP(mode_1) [pw::Application begin Create]
  set _TMP(PW_1) [pw::Shape create]
  $_TMP(PW_1) sphere -radius 3 -baseAngle 0 -topAngle 180
  
  $_TMP(PW_1) setTransform [list 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1]
  $_TMP(PW_1) setPivot Center
  $_TMP(PW_1) setSectionMinimum 0
  $_TMP(PW_1) setSectionMaximum 360
  $_TMP(PW_1) setSidesType Plane
  $_TMP(PW_1) setBaseType Plane
  $_TMP(PW_1) setTopType Plane
  $_TMP(PW_1) setEnclosingEntities {}
  set _TMP(PW_2) [$_TMP(PW_1) createModels]
  set _DB(3) [pw::DatabaseEntity getByName model-2]
  unset _TMP(PW_2)
  pw::Entity delete $_TMP(PW_1)
  unset _TMP(PW_1)
$_TMP(mode_1) end
unset _TMP(mode_1)
pw::Application markUndoLevel {Create Shape}

set _TMP(mode_1) [pw::Application begin Create]
  set _TMP(PW_1) [pw::Shape create]
  pw::Entity delete $_TMP(PW_1)
  unset _TMP(PW_1)
  set _TMP(PW_1) [pw::GridShape create]
  $_TMP(PW_1) box -width 0.5 -height 0.5 -length 0.5
  $_TMP(PW_1) setGridType Structured
  $_TMP(PW_1) setTransform [list 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1]
  $_TMP(PW_1) setPivot Base
  $_TMP(PW_1) setSectionMinimum 0
  $_TMP(PW_1) setSectionMaximum 360
  $_TMP(PW_1) setSidesType Plane
  $_TMP(PW_1) setBaseType Plane
  $_TMP(PW_1) setTopType Plane
  $_TMP(PW_1) setEnclosingEntities {}
  $_TMP(PW_1) clearSizeFieldEntities
  $_TMP(PW_1) updateGridEntities
  set _CN(1) [pw::GridEntity getByName con-1]
  set _CN(2) [pw::GridEntity getByName con-2]
  set _CN(3) [pw::GridEntity getByName con-3]
  set _CN(4) [pw::GridEntity getByName con-4]
  set _CN(5) [pw::GridEntity getByName con-5]
  set _CN(6) [pw::GridEntity getByName con-6]
  set _CN(7) [pw::GridEntity getByName con-7]
  set _CN(8) [pw::GridEntity getByName con-8]
  set _CN(9) [pw::GridEntity getByName con-9]
  set _CN(10) [pw::GridEntity getByName con-10]
  set _CN(11) [pw::GridEntity getByName con-11]
  set _CN(12) [pw::GridEntity getByName con-12]
  set _DM(1) [pw::GridEntity getByName dom-1]
  set _DM(2) [pw::GridEntity getByName dom-2]
  set _DM(3) [pw::GridEntity getByName dom-3]
  set _DM(4) [pw::GridEntity getByName dom-4]
  set _DM(5) [pw::GridEntity getByName dom-5]
  set _DM(6) [pw::GridEntity getByName dom-6]
  set _BL(1) [pw::GridEntity getByName blk-1]
  set _TMP(PW_2) [$_TMP(PW_1) getGridEntities]
  unset _TMP(PW_2)
  unset _TMP(PW_1)
$_TMP(mode_1) end
unset _TMP(mode_1)
pw::Application markUndoLevel {Create Shape}

set _TMP(PW_1) [pw::Collection create]
$_TMP(PW_1) set [list $_CN(7) $_CN(3) $_CN(4) $_CN(12) $_CN(11) $_CN(8) $_CN(9) $_CN(10) $_CN(2) $_CN(1) $_CN(6) $_CN(5)]
$_TMP(PW_1) do setDimension $nc
$_TMP(PW_1) delete
unset _TMP(PW_1)
pw::CutPlane refresh
pw::Application markUndoLevel Dimension

pw::Application setClipboard [list $_CN(7) $_CN(3) $_CN(4) $_CN(12) $_CN(11) $_CN(8) $_CN(9) $_CN(10) $_CN(2) $_CN(1) $_CN(6) $_CN(5) $_DM(1) $_DM(6) $_DM(3) $_DM(4) $_DM(5) $_DM(2)]
pw::Entity checkDelete -freed _TMP(freed) [list $_CN(7) $_CN(3) $_CN(4) $_CN(12) $_CN(11) $_CN(8) $_CN(9) $_CN(10) $_CN(2) $_CN(1) $_CN(6) $_CN(5) $_DM(1) $_DM(6) $_DM(3) $_DM(4) $_DM(5) $_DM(2)]
pw::Entity delete [concat $_TMP(freed) [list $_CN(7) $_CN(3) $_CN(4) $_CN(12) $_CN(11) $_CN(8) $_CN(9) $_CN(10) $_CN(2) $_CN(1) $_CN(6) $_CN(5) $_DM(1) $_DM(6) $_DM(3) $_DM(4) $_DM(5) $_DM(2)]]
pw::Application markUndoLevel Cut

unset _TMP(freed)
set _TMP(mode_1) [pw::Application begin Paste]
  set _TMP(PW_1) [$_TMP(mode_1) getEntities]
  set _TMP(mode_2) [pw::Application begin Modify $_TMP(PW_1)]
    pw::Entity transform [pwu::Transform translation {0 0 -0.25}] [$_TMP(mode_2) getEntities]
  $_TMP(mode_2) end
  unset _TMP(mode_2)
$_TMP(mode_1) end
unset _TMP(mode_1)
pw::Application markUndoLevel Paste

unset _TMP(PW_1)
set _DM(1) [pw::GridEntity getByName dom-2]
set _DM(2) [pw::GridEntity getByName dom-6]
set _DM(3) [pw::GridEntity getByName dom-3]
set _DM(4) [pw::GridEntity getByName dom-5]
set _DM(5) [pw::GridEntity getByName dom-4]
set _DM(6) [pw::GridEntity getByName dom-1]
set _DB(4) [pw::DatabaseEntity getByName quilt-1]
set _TMP(PW_1) [subst [list $_DM(1) $_DM(2) $_DM(3) $_DM(4) $_DM(5) $_DM(6)]]
set _TMP(mode_1) [pw::Application begin Modify $_TMP(PW_1)]
  set _TMP(PW_2) [list $_DB(4)]
  pw::Entity project -type ClosestPoint $_TMP(PW_1) $_TMP(PW_2)
  unset _TMP(PW_2)
$_TMP(mode_1) end
unset _TMP(mode_1)
pw::Application markUndoLevel Project

unset _TMP(PW_1)
set _TMP(mode_1) [pw::Application begin EllipticSolver [list $_DM(1) $_DM(2) $_DM(3) $_DM(4) $_DM(5) $_DM(6)]]
  $_TMP(mode_1) setActiveSubGrids $_DM(1) [list]
  $_TMP(mode_1) setActiveSubGrids $_DM(2) [list]
  $_TMP(mode_1) setActiveSubGrids $_DM(3) [list]
  $_TMP(mode_1) setActiveSubGrids $_DM(4) [list]
  $_TMP(mode_1) setActiveSubGrids $_DM(5) [list]
  $_TMP(mode_1) setActiveSubGrids $_DM(6) [list]
  $_TMP(mode_1) run -entities [list $_DM(6) $_DM(1) $_DM(3) $_DM(5) $_DM(4) $_DM(2)] Initialize
  $_TMP(mode_1) setActiveSubGrids $_DM(1) [list]
  $_TMP(mode_1) setActiveSubGrids $_DM(2) [list]
  $_TMP(mode_1) setActiveSubGrids $_DM(3) [list]
  $_TMP(mode_1) setActiveSubGrids $_DM(4) [list]
  $_TMP(mode_1) setActiveSubGrids $_DM(5) [list]
  $_TMP(mode_1) setActiveSubGrids $_DM(6) [list]
  $_TMP(mode_1) run 40
$_TMP(mode_1) end
unset _TMP(mode_1)
pw::Application markUndoLevel Solve

set _TMP(mode_1) [pw::Application begin Create]
  set _TMP(PW_1) [pw::FaceStructured createFromDomains [list $_DM(1) $_DM(2) $_DM(3) $_DM(4) $_DM(5) $_DM(6)]]
  set _TMP(face_1) [lindex $_TMP(PW_1) 0]
  set _TMP(face_2) [lindex $_TMP(PW_1) 1]
  unset _TMP(PW_1)
  set _BL(1) [pw::BlockStructured create]
  $_BL(1) addFace $_TMP(face_1)
  set _BL(2) [pw::BlockStructured create]
  $_BL(2) addFace $_TMP(face_2)
$_TMP(mode_1) end
unset _TMP(mode_1)
set _TMP(mode_1) [pw::Application begin ExtrusionSolver [list $_BL(1) $_BL(2)]]
  $_TMP(mode_1) setKeepFailingStep true
  $_BL(1) setExtrusionSolverAttribute DirectionFlipped 1
  $_BL(2) setExtrusionSolverAttribute DirectionFlipped 1
  $_BL(1) setExtrusionSolverAttribute Mode NormalAlgebraic
  $_BL(2) setExtrusionSolverAttribute Mode NormalAlgebraic
  $_BL(1) setExtrusionSolverAttribute SpacingGrowthFactor $gf
  $_BL(2) setExtrusionSolverAttribute SpacingGrowthFactor $gf
  $_BL(1) setExtrusionSolverAttribute NormalInitialStepSize $ds
  $_BL(2) setExtrusionSolverAttribute NormalInitialStepSize $ds
  $_BL(1) setExtrusionSolverAttribute NormalMaximumStepSize $max_ds
  $_BL(2) setExtrusionSolverAttribute NormalMaximumStepSize $max_ds
  $_TMP(mode_1) run $nsteps
  pw::Display resetView -Z
  $_TMP(mode_1) run 1
$_TMP(mode_1) end
unset _TMP(mode_1)
pw::Application markUndoLevel {Extrude, Normal}

unset _TMP(face_2)
unset _TMP(face_1)

pw::Layer setDescription 0 sphere
pw::Layer setDescription 1 background

# # Split outer surface sphere domains:
# # Appended by Pointwise V18.4R2 - Thu Nov 11 08:39:48 2021

# set _DM(7) [pw::GridEntity getByName dom-15]
# set _DM(8) [pw::GridEntity getByName dom-7]
# set _DM(9) [pw::GridEntity getByName dom-11]
# set _DM(10) [pw::GridEntity getByName dom-14]
# set _DM(11) [pw::GridEntity getByName dom-12]
# set _CN(1) [pw::GridEntity getByName con-26]
# set _DM(12) [pw::GridEntity getByName dom-13]
# set _DM(13) [pw::GridEntity getByName dom-24]
# set _CN(2) [pw::GridEntity getByName con-27]
# set _CN(3) [pw::GridEntity getByName con-28]
# set _CN(4) [pw::GridEntity getByName con-24]
# set _CN(5) [pw::GridEntity getByName con-25]
# set _TMP(split_params) [list]
# lappend _TMP(split_params) [lindex [$_DM(7) closestCoordinate [$_CN(1) getPosition -arc 1]] 1]
# set _TMP(PW_1) [$_DM(7) split -J $_TMP(split_params)]
# unset _TMP(PW_1)
# unset _TMP(split_params)
# pw::Application markUndoLevel Split

# set _DM(14) [pw::GridEntity getByName dom-15-split-2]
# set _DM(15) [pw::GridEntity getByName dom-15-split-1]
# set _TMP(split_params) [list]
# lappend _TMP(split_params) [lindex [$_DM(14) closestCoordinate [$_CN(4) getPosition -arc 0]] 1]
# set _TMP(PW_1) [$_DM(14) split -J $_TMP(split_params)]
# unset _TMP(PW_1)
# unset _TMP(split_params)
# pw::Application markUndoLevel Split

# set _DM(16) [pw::GridEntity getByName dom-15-split-2-split-2]
# set _DM(17) [pw::GridEntity getByName dom-15-split-2-split-1]
# set _CN(6) [pw::GridEntity getByName con-13]
# set _CN(7) [pw::GridEntity getByName con-15]
# set _TMP(split_params) [list]
# lappend _TMP(split_params) [lindex [$_DM(13) closestCoordinate [$_CN(6) getPosition -arc 0]] 1]
# set _TMP(PW_1) [$_DM(13) split -J $_TMP(split_params)]
# unset _TMP(PW_1)
# unset _TMP(split_params)
# pw::Application markUndoLevel Split

# set _DM(18) [pw::GridEntity getByName dom-24-split-2]
# set _DM(19) [pw::GridEntity getByName dom-9]
# set _DM(20) [pw::GridEntity getByName dom-8]
# set _CN(8) [pw::GridEntity getByName con-14]
# set _CN(9) [pw::GridEntity getByName con-16]
# set _TMP(split_params) [list]
# lappend _TMP(split_params) [lindex [$_DM(18) closestCoordinate [$_CN(6) getPosition -arc 1]] 1]
# set _TMP(PW_1) [$_DM(18) split -J $_TMP(split_params)]
# unset _TMP(PW_1)
# unset _TMP(split_params)
# pw::Application markUndoLevel Split

pw::Display isolateLayer 1
pw::Display showLayer 0

# Add blocks around the sphere
# Appended by Pointwise V18.4R2 - Thu Nov 11 09:20:19 2021

set _TMP(mode_1) [pw::Application begin Create]
  set _TMP(PW_1) [pw::Shape create]
  pw::Entity delete $_TMP(PW_1)
  unset _TMP(PW_1)
  set _TMP(PW_1) [pw::GridShape create]
  set _DM(7) [pw::GridEntity getByName dom-10]
  set _DM(8) [pw::GridEntity getByName dom-8]
  set _DM(9) [pw::GridEntity getByName dom-15]
  set _DM(10) [pw::GridEntity getByName dom-24]
  set _DM(11) [pw::GridEntity getByName dom-11]
  set _DM(12) [pw::GridEntity getByName dom-7]
  set _DM(13) [pw::GridEntity getByName dom-13]
  set _DM(14) [pw::GridEntity getByName dom-9]
  set _DM(15) [pw::GridEntity getByName dom-14]
  set _DM(16) [pw::GridEntity getByName dom-12]
  set _CN(1) [pw::GridEntity getByName con-14]
  set _CN(2) [pw::GridEntity getByName con-13]
  set _CN(3) [pw::GridEntity getByName con-16]
  set _CN(4) [pw::GridEntity getByName con-15]
  set _CN(5) [pw::GridEntity getByName con-17]
  set _CN(6) [pw::GridEntity getByName con-18]
  set _CN(7) [pw::GridEntity getByName con-19]
  set _CN(8) [pw::GridEntity getByName con-21]
  set _CN(9) [pw::GridEntity getByName con-20]
  set _CN(10) [pw::GridEntity getByName con-22]
  set _CN(11) [pw::GridEntity getByName con-25]
  set _CN(12) [pw::GridEntity getByName con-26]
  set _CN(13) [pw::GridEntity getByName con-28]
  set _CN(14) [pw::GridEntity getByName con-27]
  set _CN(15) [pw::GridEntity getByName con-24]
  set _CN(16) [pw::GridEntity getByName con-23]
  set _CN(17) [pw::GridEntity getByName con-5]
  set _CN(18) [pw::GridEntity getByName con-6]
  set _CN(19) [pw::GridEntity getByName con-1]
  set _CN(20) [pw::GridEntity getByName con-2]
  set _CN(21) [pw::GridEntity getByName con-10]
  set _CN(22) [pw::GridEntity getByName con-9]
  set _CN(23) [pw::GridEntity getByName con-8]
  set _CN(24) [pw::GridEntity getByName con-11]
  set _CN(25) [pw::GridEntity getByName con-12]
  set _CN(26) [pw::GridEntity getByName con-4]
  set _CN(27) [pw::GridEntity getByName con-3]
  set _CN(28) [pw::GridEntity getByName con-7]
  set _DB(5) [pw::DatabaseEntity getByName quilt-2]
  pw::Display resetView -Z
  pw::Display resetView +X
  pw::Display resetView -Z
  $_TMP(PW_1) box -width 9.22142948402 -height 9.22142948402 -length 9.22142948351
  $_TMP(PW_1) setGridType Structured
  $_TMP(PW_1) setTransform [list 1 -0 0 0 0 1 0 0 -0 0 1 0 -1.93178806285e-14 -2.22044604925e-16 -4.61071474175 1]
  $_TMP(PW_1) setPivot Base
  $_TMP(PW_1) setSectionMinimum 0
  $_TMP(PW_1) setSectionMaximum 360
  $_TMP(PW_1) setSidesType Plane
  $_TMP(PW_1) setBaseType Plane
  $_TMP(PW_1) setTopType Plane
  $_TMP(PW_1) setEnclosingEntities [list $_BL(2) $_BL(1) $_DM(7) $_DM(8) $_DM(9) $_DM(10) $_DM(11) $_DM(12) $_DM(13) $_DM(14) $_DM(15) $_DM(16) $_DM(6) $_DM(1) $_DM(2) $_DM(5) $_DM(3) $_DM(4) $_DB(2) $_DB(1) $_CN(1) $_CN(2) $_CN(3) $_CN(4) $_CN(5) $_CN(6) $_CN(7) $_CN(8) $_CN(9) $_CN(10) $_CN(11) $_CN(12) $_CN(13) $_CN(14) $_CN(15) $_CN(16) $_CN(17) $_CN(18) $_CN(19) $_CN(20) $_CN(21) $_CN(22) $_CN(23) $_CN(24) $_CN(25) $_CN(26) $_CN(27) $_CN(28) $_DB(5) $_DB(4)]
  $_TMP(PW_1) clearSizeFieldEntities
  $_TMP(PW_1) includeSizeFieldEntity [list $_BL(2) $_BL(1) $_DM(7) $_DM(8) $_DM(9) $_DM(10) $_DM(11) $_DM(12) $_DM(13) $_DM(14) $_DM(15) $_DM(16) $_DM(6) $_DM(1) $_DM(2) $_DM(5) $_DM(3) $_DM(4) $_DB(2) $_DB(1) $_CN(1) $_CN(2) $_CN(3) $_CN(4) $_CN(5) $_CN(6) $_CN(7) $_CN(8) $_CN(9) $_CN(10) $_CN(11) $_CN(12) $_CN(13) $_CN(14) $_CN(15) $_CN(16) $_CN(17) $_CN(18) $_CN(19) $_CN(20) $_CN(21) $_CN(22) $_CN(23) $_CN(24) $_CN(25) $_CN(26) $_CN(27) $_CN(28) $_DB(5) $_DB(4)] true
  $_TMP(PW_1) updateGridEntities
  set _CN(29) [pw::GridEntity getByName con-29]
  set _CN(30) [pw::GridEntity getByName con-30]
  set _CN(31) [pw::GridEntity getByName con-31]
  set _CN(32) [pw::GridEntity getByName con-32]
  set _CN(33) [pw::GridEntity getByName con-33]
  set _CN(34) [pw::GridEntity getByName con-34]
  set _CN(35) [pw::GridEntity getByName con-35]
  set _CN(36) [pw::GridEntity getByName con-36]
  set _CN(37) [pw::GridEntity getByName con-37]
  set _CN(38) [pw::GridEntity getByName con-38]
  set _CN(39) [pw::GridEntity getByName con-39]
  set _CN(40) [pw::GridEntity getByName con-40]
  set _DM(17) [pw::GridEntity getByName dom-25]
  set _DM(18) [pw::GridEntity getByName dom-26]
  set _DM(19) [pw::GridEntity getByName dom-27]
  set _DM(20) [pw::GridEntity getByName dom-28]
  set _DM(21) [pw::GridEntity getByName dom-29]
  set _DM(22) [pw::GridEntity getByName dom-30]
  set _BL(1) [pw::GridEntity getByName blk-3]
  set _TMP(PW_2) [$_TMP(PW_1) getGridEntities]
  unset _TMP(PW_2)
  unset _TMP(PW_1)
$_TMP(mode_1) end
unset _TMP(mode_1)
pw::Application markUndoLevel {Create Shape}

pw::Display hideLayer 0
set _TMP(PW_1) [pw::Collection create]
$_TMP(PW_1) set [list $_CN(33) $_CN(34) $_CN(35) $_CN(38) $_CN(30) $_CN(31) $_CN(32) $_CN(29) $_CN(39) $_CN(37) $_CN(36) $_CN(40)]
$_TMP(PW_1) do setDimensionFromSpacing -resetDistribution $dx_background
$_TMP(PW_1) delete
unset _TMP(PW_1)
pw::CutPlane refresh
pw::Application markUndoLevel Dimension

set _TMP(mode_1) [pw::Application begin Create]
  set _TMP(PW_1) [pw::SegmentSpline create]
  $_TMP(PW_1) addPoint [$_CN(29) getPosition -arc 1]
  $_TMP(PW_1) addPoint {16 4.6107147 -4.6107147}
  set _CN(41) [pw::Connector create]
  $_CN(41) addSegment $_TMP(PW_1)
  unset _TMP(PW_1)
  $_CN(41) calculateDimension
$_TMP(mode_1) end
unset _TMP(mode_1)
pw::Application markUndoLevel {Create 2 Point Connector}

set _TMP(mode_1) [pw::Application begin Create]
  set _TMP(PW_1) [pw::SegmentSpline create]
  $_TMP(PW_1) delete
  unset _TMP(PW_1)
$_TMP(mode_1) abort
unset _TMP(mode_1)
$_CN(41) setDimension 50
pw::CutPlane refresh
pw::Application markUndoLevel Dimension

set _TMP(PW_1) [pw::Collection create]
$_TMP(PW_1) set [list $_CN(41)]
$_TMP(PW_1) do setRenderAttribute PointMode None
$_TMP(PW_1) delete
unset _TMP(PW_1)
pw::Application markUndoLevel {Modify Entity Display}

set _TMP(PW_1) [pw::Collection create]
$_TMP(PW_1) set [list $_CN(41)]
$_TMP(PW_1) do setRenderAttribute PointMode All
$_TMP(PW_1) delete
unset _TMP(PW_1)
pw::Application markUndoLevel {Modify Entity Display}

set _TMP(mode_1) [pw::Application begin Modify [list $_CN(41)]]
  set _TMP(PW_1) [$_CN(41) getDistribution 1]
  $_TMP(PW_1) setBeginSpacing $dx_background
  unset _TMP(PW_1)
$_TMP(mode_1) end
unset _TMP(mode_1)
pw::Application markUndoLevel {Change Spacing}

set _TMP(mode_1) [pw::Application begin Create]
  set _TMP(PW_1) [pw::FaceStructured createFromDomains [list $_DM(19)]]
  set _TMP(face_1) [lindex $_TMP(PW_1) 0]
  unset _TMP(PW_1)
  set _BL(2) [pw::BlockStructured create]
  $_BL(2) addFace $_TMP(face_1)
$_TMP(mode_1) end
unset _TMP(mode_1)
set _TMP(mode_1) [pw::Application begin ExtrusionSolver [list $_BL(2)]]
  $_TMP(mode_1) setKeepFailingStep true
  $_BL(2) setExtrusionSolverAttribute Mode Path
  $_BL(2) setExtrusionSolverAttribute PathConnectors [list $_CN(41)]
  $_BL(2) setExtrusionSolverAttribute PathUseTangent 1
  $_TMP(mode_1) run 49
$_TMP(mode_1) end
unset _TMP(mode_1)
unset _TMP(face_1)
pw::Application markUndoLevel {Extrude, Path}


# Create BC and volumes
# Appended by Pointwise V18.4R2 - Mon Nov 15 08:18:33 2021

pw::Display showLayer 0
set _TMP(PW_1) [pw::VolumeCondition create]
pw::Application markUndoLevel {Create VC}

set _TMP(PW_2) [pw::VolumeCondition create]
pw::Application markUndoLevel {Create VC}

$_TMP(PW_1) setName background
pw::Application markUndoLevel {Name VC}

$_TMP(PW_2) setName sphere
pw::Application markUndoLevel {Name VC}

$_TMP(PW_1) apply [list $_BL(2) $_BL(1)]
pw::Application markUndoLevel {Set VC}

set _BL(1) [pw::GridEntity getByName blk-1]
$_TMP(PW_2) apply [list $_BL(1)]
pw::Application markUndoLevel {Set VC}

set _BL(2) [pw::GridEntity getByName blk-2]
$_TMP(PW_2) apply [list $_BL(2) $_BL(1)]
pw::Application markUndoLevel {Set VC}

unset _TMP(PW_2)
unset _TMP(PW_1)
set _DM(23) [pw::GridEntity getByName dom-31]
set _DM(24) [pw::GridEntity getByName dom-32]
set _DM(25) [pw::GridEntity getByName dom-33]
set _DM(26) [pw::GridEntity getByName dom-34]
set _DM(27) [pw::GridEntity getByName dom-35]
set _TMP(PW_1) [pw::BoundaryCondition getByName Unspecified]
set _TMP(PW_2) [pw::BoundaryCondition create]
pw::Application markUndoLevel {Create BC}

set _TMP(PW_3) [pw::BoundaryCondition getByName bc-2]
unset _TMP(PW_2)
set _TMP(PW_4) [pw::BoundaryCondition create]
pw::Application markUndoLevel {Create BC}

set _TMP(PW_5) [pw::BoundaryCondition getByName bc-3]
unset _TMP(PW_4)
set _TMP(PW_6) [pw::BoundaryCondition create]
pw::Application markUndoLevel {Create BC}

set _TMP(PW_7) [pw::BoundaryCondition getByName bc-4]
unset _TMP(PW_6)
set _TMP(PW_8) [pw::BoundaryCondition create]
pw::Application markUndoLevel {Create BC}

set _TMP(PW_9) [pw::BoundaryCondition getByName bc-5]
unset _TMP(PW_8)
set _TMP(PW_10) [pw::BoundaryCondition create]
pw::Application markUndoLevel {Create BC}

set _TMP(PW_11) [pw::BoundaryCondition getByName bc-6]
unset _TMP(PW_10)
set _TMP(PW_12) [pw::BoundaryCondition create]
pw::Application markUndoLevel {Create BC}

set _TMP(PW_13) [pw::BoundaryCondition getByName bc-7]
unset _TMP(PW_12)
set _TMP(PW_14) [pw::BoundaryCondition create]
pw::Application markUndoLevel {Create BC}

set _TMP(PW_15) [pw::BoundaryCondition getByName bc-8]
unset _TMP(PW_14)
$_TMP(PW_3) setName wall
pw::Application markUndoLevel {Name BC}

$_TMP(PW_5) setName overset
pw::Application markUndoLevel {Name BC}

$_TMP(PW_7) setName inlet
pw::Application markUndoLevel {Name BC}

$_TMP(PW_9) setName outlet
pw::Application markUndoLevel {Name BC}

$_TMP(PW_11) setName front
pw::Application markUndoLevel {Name BC}

$_TMP(PW_13) setName back
pw::Application markUndoLevel {Name BC}

$_TMP(PW_15) setName top
pw::Application markUndoLevel {Name BC}

set _TMP(PW_16) [pw::BoundaryCondition create]
pw::Application markUndoLevel {Create BC}

set _TMP(PW_17) [pw::BoundaryCondition getByName bc-9]
unset _TMP(PW_16)
$_TMP(PW_17) setName bottom
pw::Application markUndoLevel {Name BC}

$_TMP(PW_3) setPhysicalType -usage CAE {Side Set}
pw::Application markUndoLevel {Change BC Type}

$_TMP(PW_5) setPhysicalType -usage CAE {Side Set}
pw::Application markUndoLevel {Change BC Type}

$_TMP(PW_7) setPhysicalType -usage CAE {Side Set}
pw::Application markUndoLevel {Change BC Type}

$_TMP(PW_9) setPhysicalType -usage CAE {Side Set}
pw::Application markUndoLevel {Change BC Type}

$_TMP(PW_11) setPhysicalType -usage CAE {Node Set}
pw::Application markUndoLevel {Change BC Type}

$_TMP(PW_13) setPhysicalType -usage CAE {Side Set}
pw::Application markUndoLevel {Change BC Type}

$_TMP(PW_15) setPhysicalType -usage CAE {Side Set}
pw::Application markUndoLevel {Change BC Type}

$_TMP(PW_17) setPhysicalType -usage CAE {Side Set}
pw::Application markUndoLevel {Change BC Type}

$_TMP(PW_5) apply [list [list $_BL(1) $_DM(9)] [list $_BL(2) $_DM(10)]]
pw::Application markUndoLevel {Set BC}

$_TMP(PW_3) apply [list [list $_BL(2) $_DM(5)] [list $_BL(1) $_DM(1)] [list $_BL(2) $_DM(4)] [list $_BL(1) $_DM(3)] [list $_BL(1) $_DM(6)] [list $_BL(2) $_DM(2)]]
pw::Application markUndoLevel {Set BC}

pw::Display resetView -Z
unset _TMP(PW_1)
unset _TMP(PW_3)
unset _TMP(PW_5)
unset _TMP(PW_7)
unset _TMP(PW_9)
unset _TMP(PW_11)
unset _TMP(PW_13)
unset _TMP(PW_15)
unset _TMP(PW_17)

# Unstructured background block
# Appended by Pointwise V18.4R2 - Mon Nov 15 09:18:13 2021

set _TMP(mode_1) [pw::Application begin Create]
  set _TMP(PW_1) [pw::GridShape create]
  set _BL(1) [pw::GridEntity getByName blk-3]
  $_TMP(PW_1) box -width 92.2142948402 -height 46.1071474201 -length 46.1071474176
  $_TMP(PW_1) setGridType Unstructured
  $_TMP(PW_1) setTransform [list 1 0 0 0 0 1 0 0 0 0 1 0 23 0 -23.0535737088 1]
  $_TMP(PW_1) setPivot Base
  $_TMP(PW_1) setSectionMinimum 0
  $_TMP(PW_1) setSectionMaximum 360
  $_TMP(PW_1) setSidesType Plane
  $_TMP(PW_1) setBaseType Plane
  $_TMP(PW_1) setTopType Plane
  $_TMP(PW_1) setEnclosingEntities $_BL(1)
  $_TMP(PW_1) clearSizeFieldEntities
  $_TMP(PW_1) includeSizeFieldEntity $_BL(1) true
  $_TMP(PW_1) updateGridEntities
  set _CN(42) [pw::GridEntity getByName con-50]
  set _CN(43) [pw::GridEntity getByName con-51]
  set _CN(44) [pw::GridEntity getByName con-52]
  set _CN(45) [pw::GridEntity getByName con-53]
  set _CN(46) [pw::GridEntity getByName con-54]
  set _CN(47) [pw::GridEntity getByName con-55]
  set _CN(48) [pw::GridEntity getByName con-56]
  set _CN(49) [pw::GridEntity getByName con-57]
  set _CN(50) [pw::GridEntity getByName con-58]
  set _CN(51) [pw::GridEntity getByName con-59]
  set _CN(52) [pw::GridEntity getByName con-60]
  set _CN(53) [pw::GridEntity getByName con-61]
  set _DM(28) [pw::GridEntity getByName dom-36]
  set _DM(29) [pw::GridEntity getByName dom-37]
  set _DM(30) [pw::GridEntity getByName dom-38]
  set _DM(31) [pw::GridEntity getByName dom-39]
  set _DM(32) [pw::GridEntity getByName dom-40]
  set _DM(33) [pw::GridEntity getByName dom-41]
  set _BL(2) [pw::GridEntity getByName blk-5]
  set _TMP(PW_2) [$_TMP(PW_1) getGridEntities]
  unset _TMP(PW_2)
  unset _TMP(PW_1)
$_TMP(mode_1) end
unset _TMP(mode_1)
pw::Application markUndoLevel {Create Shape}

set _TMP(PW_1) [pw::Collection create]
$_TMP(PW_1) set [list $_CN(44) $_CN(45) $_CN(46) $_CN(47) $_CN(48) $_CN(49) $_CN(50) $_CN(51) $_CN(52) $_CN(53) $_CN(43) $_CN(42)]
$_TMP(PW_1) do setDimensionFromSpacing -resetDistribution 4
$_TMP(PW_1) delete
unset _TMP(PW_1)
pw::CutPlane refresh
pw::Application markUndoLevel Dimension

pw::Entity delete [list $_BL(2)]
pw::Application markUndoLevel Delete

set _TMP(mode_1) [pw::Application begin Create]
  set _BL(3) [pw::BlockStructured create]
$_TMP(mode_1) abort
unset _TMP(mode_1)
pw::Application setGridPreference Unstructured
set _TMP(mode_1) [pw::Application begin Create]
  set _BL(4) [pw::BlockUnstructured create]
  set _TMP(face_1) [pw::FaceUnstructured create]
  $_TMP(face_1) addDomain $_DM(31)
  $_TMP(face_1) addDomain $_DM(32)
  $_TMP(face_1) addDomain $_DM(29)
  $_TMP(face_1) addDomain $_DM(33)
  $_TMP(face_1) addDomain $_DM(30)
  $_TMP(face_1) addDomain $_DM(28)
  $_BL(4) addFace $_TMP(face_1)
  set _TMP(face_2) [pw::FaceUnstructured create]
  $_TMP(face_2) addDomain $_DM(18)
  $_TMP(face_2) addDomain $_DM(26)
  $_TMP(face_2) addDomain $_DM(27)
  $_TMP(face_2) addDomain $_DM(24)
  $_TMP(face_2) addDomain $_DM(20)
  unset _TMP(face_2)
  unset _TMP(face_1)
$_TMP(mode_1) abort
unset _TMP(mode_1)
set _TMP(mode_1) [pw::Application begin Create]
  set _BL(5) [pw::BlockUnstructured create]
  set _TMP(face_1) [pw::FaceUnstructured create]
  $_TMP(face_1) addDomain $_DM(32)
  $_TMP(face_1) addDomain $_DM(28)
  $_TMP(face_1) addDomain $_DM(30)
  unset _TMP(face_1)
$_TMP(mode_1) abort
unset _TMP(mode_1)
set _TMP(mode_1) [pw::Application begin Create]
  set _BL(6) [pw::BlockUnstructured create]
  set _TMP(face_1) [pw::FaceUnstructured create]
  $_TMP(face_1) addDomain $_DM(31)
  $_TMP(face_1) addDomain $_DM(30)
  $_TMP(face_1) addDomain $_DM(29)
  $_TMP(face_1) addDomain $_DM(32)
  $_TMP(face_1) addDomain $_DM(33)
  $_TMP(face_1) addDomain $_DM(28)
  $_BL(6) addFace $_TMP(face_1)
  set _TMP(face_2) [pw::FaceUnstructured create]
  $_TMP(face_2) addDomain $_DM(18)
  $_TMP(face_2) addDomain $_DM(26)
  $_TMP(face_2) addDomain $_DM(27)
  $_TMP(face_2) addDomain $_DM(24)
  $_TMP(face_2) addDomain $_DM(17)
  $_TMP(face_2) addDomain -linkage [list 2 1 2 1 1 11 0] $_DM(21)
  $_TMP(face_2) addDomain $_DM(20)
  $_TMP(face_2) addDomain $_DM(25)
  $_TMP(face_2) addDomain $_DM(23)
  $_TMP(face_2) addDomain $_DM(22)
  $_BL(6) addFace $_TMP(face_2)
$_TMP(mode_1) end
unset _TMP(mode_1)
unset _TMP(face_2)
unset _TMP(face_1)
pw::Application markUndoLevel {Assemble Block}

set _TMP(mode_1) [pw::Application begin UnstructuredSolver [list $_BL(6)]]
  $_TMP(mode_1) setStopWhenFullLayersNotMet true
  $_TMP(mode_1) setAllowIncomplete true
  $_TMP(mode_1) run Initialize
$_TMP(mode_1) end
unset _TMP(mode_1)
pw::Application markUndoLevel Solve

