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
