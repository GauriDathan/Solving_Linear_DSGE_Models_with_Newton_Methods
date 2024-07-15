%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'Smets_Wouters_2007_std';
M_.dynare_version = '6.1';
oo_.dynare_version = '6.1';
options_.dynare_version = '6.1';
%
% Some global variables initialization
%
global_initialization;
options_.nograph = true;
M_.exo_names = cell(7,1);
M_.exo_names_tex = cell(7,1);
M_.exo_names_long = cell(7,1);
M_.exo_names(1) = {'ea'};
M_.exo_names_tex(1) = {'ea'};
M_.exo_names_long(1) = {'ea'};
M_.exo_names(2) = {'eb'};
M_.exo_names_tex(2) = {'eb'};
M_.exo_names_long(2) = {'eb'};
M_.exo_names(3) = {'eg'};
M_.exo_names_tex(3) = {'eg'};
M_.exo_names_long(3) = {'eg'};
M_.exo_names(4) = {'eqs'};
M_.exo_names_tex(4) = {'eqs'};
M_.exo_names_long(4) = {'eqs'};
M_.exo_names(5) = {'em'};
M_.exo_names_tex(5) = {'em'};
M_.exo_names_long(5) = {'em'};
M_.exo_names(6) = {'epinf'};
M_.exo_names_tex(6) = {'epinf'};
M_.exo_names_long(6) = {'epinf'};
M_.exo_names(7) = {'ew'};
M_.exo_names_tex(7) = {'ew'};
M_.exo_names_long(7) = {'ew'};
M_.endo_names = cell(40,1);
M_.endo_names_tex = cell(40,1);
M_.endo_names_long = cell(40,1);
M_.endo_names(1) = {'labobs'};
M_.endo_names_tex(1) = {'labobs'};
M_.endo_names_long(1) = {'labobs'};
M_.endo_names(2) = {'robs'};
M_.endo_names_tex(2) = {'robs'};
M_.endo_names_long(2) = {'robs'};
M_.endo_names(3) = {'pinfobs'};
M_.endo_names_tex(3) = {'pinfobs'};
M_.endo_names_long(3) = {'pinfobs'};
M_.endo_names(4) = {'dy'};
M_.endo_names_tex(4) = {'dy'};
M_.endo_names_long(4) = {'dy'};
M_.endo_names(5) = {'dc'};
M_.endo_names_tex(5) = {'dc'};
M_.endo_names_long(5) = {'dc'};
M_.endo_names(6) = {'dinve'};
M_.endo_names_tex(6) = {'dinve'};
M_.endo_names_long(6) = {'dinve'};
M_.endo_names(7) = {'dw'};
M_.endo_names_tex(7) = {'dw'};
M_.endo_names_long(7) = {'dw'};
M_.endo_names(8) = {'ewma'};
M_.endo_names_tex(8) = {'ewma'};
M_.endo_names_long(8) = {'ewma'};
M_.endo_names(9) = {'epinfma'};
M_.endo_names_tex(9) = {'epinfma'};
M_.endo_names_long(9) = {'epinfma'};
M_.endo_names(10) = {'zcapf'};
M_.endo_names_tex(10) = {'zcapf'};
M_.endo_names_long(10) = {'zcapf'};
M_.endo_names(11) = {'rkf'};
M_.endo_names_tex(11) = {'rkf'};
M_.endo_names_long(11) = {'rkf'};
M_.endo_names(12) = {'kf'};
M_.endo_names_tex(12) = {'kf'};
M_.endo_names_long(12) = {'kf'};
M_.endo_names(13) = {'pkf'};
M_.endo_names_tex(13) = {'pkf'};
M_.endo_names_long(13) = {'pkf'};
M_.endo_names(14) = {'cf'};
M_.endo_names_tex(14) = {'cf'};
M_.endo_names_long(14) = {'cf'};
M_.endo_names(15) = {'invef'};
M_.endo_names_tex(15) = {'invef'};
M_.endo_names_long(15) = {'invef'};
M_.endo_names(16) = {'yf'};
M_.endo_names_tex(16) = {'yf'};
M_.endo_names_long(16) = {'yf'};
M_.endo_names(17) = {'labf'};
M_.endo_names_tex(17) = {'labf'};
M_.endo_names_long(17) = {'labf'};
M_.endo_names(18) = {'wf'};
M_.endo_names_tex(18) = {'wf'};
M_.endo_names_long(18) = {'wf'};
M_.endo_names(19) = {'rrf'};
M_.endo_names_tex(19) = {'rrf'};
M_.endo_names_long(19) = {'rrf'};
M_.endo_names(20) = {'mc'};
M_.endo_names_tex(20) = {'mc'};
M_.endo_names_long(20) = {'mc'};
M_.endo_names(21) = {'zcap'};
M_.endo_names_tex(21) = {'zcap'};
M_.endo_names_long(21) = {'zcap'};
M_.endo_names(22) = {'rk'};
M_.endo_names_tex(22) = {'rk'};
M_.endo_names_long(22) = {'rk'};
M_.endo_names(23) = {'k'};
M_.endo_names_tex(23) = {'k'};
M_.endo_names_long(23) = {'k'};
M_.endo_names(24) = {'pk'};
M_.endo_names_tex(24) = {'pk'};
M_.endo_names_long(24) = {'pk'};
M_.endo_names(25) = {'c'};
M_.endo_names_tex(25) = {'c'};
M_.endo_names_long(25) = {'c'};
M_.endo_names(26) = {'inve'};
M_.endo_names_tex(26) = {'inve'};
M_.endo_names_long(26) = {'inve'};
M_.endo_names(27) = {'y'};
M_.endo_names_tex(27) = {'y'};
M_.endo_names_long(27) = {'y'};
M_.endo_names(28) = {'lab'};
M_.endo_names_tex(28) = {'lab'};
M_.endo_names_long(28) = {'lab'};
M_.endo_names(29) = {'pinf'};
M_.endo_names_tex(29) = {'pinf'};
M_.endo_names_long(29) = {'pinf'};
M_.endo_names(30) = {'w'};
M_.endo_names_tex(30) = {'w'};
M_.endo_names_long(30) = {'w'};
M_.endo_names(31) = {'r'};
M_.endo_names_tex(31) = {'r'};
M_.endo_names_long(31) = {'r'};
M_.endo_names(32) = {'a'};
M_.endo_names_tex(32) = {'a'};
M_.endo_names_long(32) = {'a'};
M_.endo_names(33) = {'b'};
M_.endo_names_tex(33) = {'b'};
M_.endo_names_long(33) = {'b'};
M_.endo_names(34) = {'g'};
M_.endo_names_tex(34) = {'g'};
M_.endo_names_long(34) = {'g'};
M_.endo_names(35) = {'qs'};
M_.endo_names_tex(35) = {'qs'};
M_.endo_names_long(35) = {'qs'};
M_.endo_names(36) = {'ms'};
M_.endo_names_tex(36) = {'ms'};
M_.endo_names_long(36) = {'ms'};
M_.endo_names(37) = {'spinf'};
M_.endo_names_tex(37) = {'spinf'};
M_.endo_names_long(37) = {'spinf'};
M_.endo_names(38) = {'sw'};
M_.endo_names_tex(38) = {'sw'};
M_.endo_names_long(38) = {'sw'};
M_.endo_names(39) = {'kpf'};
M_.endo_names_tex(39) = {'kpf'};
M_.endo_names_long(39) = {'kpf'};
M_.endo_names(40) = {'kp'};
M_.endo_names_tex(40) = {'kp'};
M_.endo_names_long(40) = {'kp'};
M_.endo_partitions = struct();
M_.param_names = cell(46,1);
M_.param_names_tex = cell(46,1);
M_.param_names_long = cell(46,1);
M_.param_names(1) = {'curvw'};
M_.param_names_tex(1) = {'curvw'};
M_.param_names_long(1) = {'curvw'};
M_.param_names(2) = {'cgy'};
M_.param_names_tex(2) = {'cgy'};
M_.param_names_long(2) = {'cgy'};
M_.param_names(3) = {'curvp'};
M_.param_names_tex(3) = {'curvp'};
M_.param_names_long(3) = {'curvp'};
M_.param_names(4) = {'constelab'};
M_.param_names_tex(4) = {'constelab'};
M_.param_names_long(4) = {'constelab'};
M_.param_names(5) = {'constepinf'};
M_.param_names_tex(5) = {'constepinf'};
M_.param_names_long(5) = {'constepinf'};
M_.param_names(6) = {'constebeta'};
M_.param_names_tex(6) = {'constebeta'};
M_.param_names_long(6) = {'constebeta'};
M_.param_names(7) = {'cmaw'};
M_.param_names_tex(7) = {'cmaw'};
M_.param_names_long(7) = {'cmaw'};
M_.param_names(8) = {'cmap'};
M_.param_names_tex(8) = {'cmap'};
M_.param_names_long(8) = {'cmap'};
M_.param_names(9) = {'calfa'};
M_.param_names_tex(9) = {'calfa'};
M_.param_names_long(9) = {'calfa'};
M_.param_names(10) = {'czcap'};
M_.param_names_tex(10) = {'czcap'};
M_.param_names_long(10) = {'czcap'};
M_.param_names(11) = {'csadjcost'};
M_.param_names_tex(11) = {'csadjcost'};
M_.param_names_long(11) = {'csadjcost'};
M_.param_names(12) = {'ctou'};
M_.param_names_tex(12) = {'ctou'};
M_.param_names_long(12) = {'ctou'};
M_.param_names(13) = {'csigma'};
M_.param_names_tex(13) = {'csigma'};
M_.param_names_long(13) = {'csigma'};
M_.param_names(14) = {'chabb'};
M_.param_names_tex(14) = {'chabb'};
M_.param_names_long(14) = {'chabb'};
M_.param_names(15) = {'ccs'};
M_.param_names_tex(15) = {'ccs'};
M_.param_names_long(15) = {'ccs'};
M_.param_names(16) = {'cinvs'};
M_.param_names_tex(16) = {'cinvs'};
M_.param_names_long(16) = {'cinvs'};
M_.param_names(17) = {'cfc'};
M_.param_names_tex(17) = {'cfc'};
M_.param_names_long(17) = {'cfc'};
M_.param_names(18) = {'cindw'};
M_.param_names_tex(18) = {'cindw'};
M_.param_names_long(18) = {'cindw'};
M_.param_names(19) = {'cprobw'};
M_.param_names_tex(19) = {'cprobw'};
M_.param_names_long(19) = {'cprobw'};
M_.param_names(20) = {'cindp'};
M_.param_names_tex(20) = {'cindp'};
M_.param_names_long(20) = {'cindp'};
M_.param_names(21) = {'cprobp'};
M_.param_names_tex(21) = {'cprobp'};
M_.param_names_long(21) = {'cprobp'};
M_.param_names(22) = {'csigl'};
M_.param_names_tex(22) = {'csigl'};
M_.param_names_long(22) = {'csigl'};
M_.param_names(23) = {'clandaw'};
M_.param_names_tex(23) = {'clandaw'};
M_.param_names_long(23) = {'clandaw'};
M_.param_names(24) = {'crdpi'};
M_.param_names_tex(24) = {'crdpi'};
M_.param_names_long(24) = {'crdpi'};
M_.param_names(25) = {'crpi'};
M_.param_names_tex(25) = {'crpi'};
M_.param_names_long(25) = {'crpi'};
M_.param_names(26) = {'crdy'};
M_.param_names_tex(26) = {'crdy'};
M_.param_names_long(26) = {'crdy'};
M_.param_names(27) = {'cry'};
M_.param_names_tex(27) = {'cry'};
M_.param_names_long(27) = {'cry'};
M_.param_names(28) = {'crr'};
M_.param_names_tex(28) = {'crr'};
M_.param_names_long(28) = {'crr'};
M_.param_names(29) = {'crhoa'};
M_.param_names_tex(29) = {'crhoa'};
M_.param_names_long(29) = {'crhoa'};
M_.param_names(30) = {'crhoas'};
M_.param_names_tex(30) = {'crhoas'};
M_.param_names_long(30) = {'crhoas'};
M_.param_names(31) = {'crhob'};
M_.param_names_tex(31) = {'crhob'};
M_.param_names_long(31) = {'crhob'};
M_.param_names(32) = {'crhog'};
M_.param_names_tex(32) = {'crhog'};
M_.param_names_long(32) = {'crhog'};
M_.param_names(33) = {'crhols'};
M_.param_names_tex(33) = {'crhols'};
M_.param_names_long(33) = {'crhols'};
M_.param_names(34) = {'crhoqs'};
M_.param_names_tex(34) = {'crhoqs'};
M_.param_names_long(34) = {'crhoqs'};
M_.param_names(35) = {'crhoms'};
M_.param_names_tex(35) = {'crhoms'};
M_.param_names_long(35) = {'crhoms'};
M_.param_names(36) = {'crhopinf'};
M_.param_names_tex(36) = {'crhopinf'};
M_.param_names_long(36) = {'crhopinf'};
M_.param_names(37) = {'crhow'};
M_.param_names_tex(37) = {'crhow'};
M_.param_names_long(37) = {'crhow'};
M_.param_names(38) = {'ctrend'};
M_.param_names_tex(38) = {'ctrend'};
M_.param_names_long(38) = {'ctrend'};
M_.param_names(39) = {'cg'};
M_.param_names_tex(39) = {'cg'};
M_.param_names_long(39) = {'cg'};
M_.param_names(40) = {'sea'};
M_.param_names_tex(40) = {'sea'};
M_.param_names_long(40) = {'sea'};
M_.param_names(41) = {'seb'};
M_.param_names_tex(41) = {'seb'};
M_.param_names_long(41) = {'seb'};
M_.param_names(42) = {'seg'};
M_.param_names_tex(42) = {'seg'};
M_.param_names_long(42) = {'seg'};
M_.param_names(43) = {'seqs'};
M_.param_names_tex(43) = {'seqs'};
M_.param_names_long(43) = {'seqs'};
M_.param_names(44) = {'sem'};
M_.param_names_tex(44) = {'sem'};
M_.param_names_long(44) = {'sem'};
M_.param_names(45) = {'sepinf'};
M_.param_names_tex(45) = {'sepinf'};
M_.param_names_long(45) = {'sepinf'};
M_.param_names(46) = {'sew'};
M_.param_names_tex(46) = {'sew'};
M_.param_names_long(46) = {'sew'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 7;
M_.endo_nbr = 40;
M_.param_nbr = 46;
M_.orig_endo_nbr = 40;
M_.aux_vars = [];
options_.varobs = cell(7, 1);
options_.varobs(1)  = {'dy'};
options_.varobs(2)  = {'dc'};
options_.varobs(3)  = {'dinve'};
options_.varobs(4)  = {'labobs'};
options_.varobs(5)  = {'pinfobs'};
options_.varobs(6)  = {'dw'};
options_.varobs(7)  = {'robs'};
options_.varobs_id = [ 4 5 6 1 3 7 2  ];
M_.Sigma_e = zeros(7, 7);
M_.Correlation_matrix = eye(7, 7);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.eq_nbr = 40;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 21 0;
 0 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 0 26 0;
 0 27 0;
 1 28 0;
 2 29 0;
 0 30 0;
 0 31 61;
 0 32 0;
 0 33 62;
 3 34 63;
 4 35 64;
 5 36 0;
 0 37 65;
 0 38 0;
 0 39 0;
 0 40 0;
 0 41 0;
 0 42 66;
 0 43 0;
 0 44 67;
 6 45 68;
 7 46 69;
 8 47 0;
 0 48 70;
 9 49 71;
 10 50 72;
 11 51 0;
 12 52 0;
 13 53 0;
 14 54 0;
 15 55 0;
 16 56 0;
 17 57 0;
 18 58 0;
 19 59 0;
 20 60 0;]';
M_.nstatic = 14;
M_.nfwrd   = 6;
M_.npred   = 14;
M_.nboth   = 6;
M_.nsfwrd   = 12;
M_.nspred   = 20;
M_.ndynamic   = 26;
M_.dynamic_tmp_nbr = [19; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'a' ;
  2 , 'name' , 'zcapf' ;
  3 , 'name' , 'rkf' ;
  4 , 'name' , 'kf' ;
  5 , 'name' , 'invef' ;
  6 , 'name' , 'pkf' ;
  7 , 'name' , 'cf' ;
  8 , 'name' , 'yf' ;
  9 , 'name' , '9' ;
  10 , 'name' , 'wf' ;
  11 , 'name' , 'kpf' ;
  12 , 'name' , 'mc' ;
  13 , 'name' , 'zcap' ;
  14 , 'name' , 'rk' ;
  15 , 'name' , 'k' ;
  16 , 'name' , 'inve' ;
  17 , 'name' , 'pk' ;
  18 , 'name' , 'c' ;
  19 , 'name' , 'y' ;
  20 , 'name' , '20' ;
  21 , 'name' , 'pinf' ;
  22 , 'name' , 'w' ;
  23 , 'name' , 'r' ;
  24 , 'name' , '24' ;
  25 , 'name' , 'b' ;
  26 , 'name' , 'g' ;
  27 , 'name' , 'qs' ;
  28 , 'name' , 'ms' ;
  29 , 'name' , 'spinf' ;
  30 , 'name' , 'epinfma' ;
  31 , 'name' , 'sw' ;
  32 , 'name' , 'ewma' ;
  33 , 'name' , 'kp' ;
  34 , 'name' , 'dy' ;
  35 , 'name' , 'dc' ;
  36 , 'name' , 'dinve' ;
  37 , 'name' , 'dw' ;
  38 , 'name' , 'pinfobs' ;
  39 , 'name' , 'robs' ;
  40 , 'name' , 'labobs' ;
};
M_.mapping.labobs.eqidx = [40 ];
M_.mapping.robs.eqidx = [39 ];
M_.mapping.pinfobs.eqidx = [38 ];
M_.mapping.dy.eqidx = [34 ];
M_.mapping.dc.eqidx = [35 ];
M_.mapping.dinve.eqidx = [36 ];
M_.mapping.dw.eqidx = [37 ];
M_.mapping.ewma.eqidx = [31 32 ];
M_.mapping.epinfma.eqidx = [29 30 ];
M_.mapping.zcapf.eqidx = [2 4 8 ];
M_.mapping.rkf.eqidx = [1 2 3 6 ];
M_.mapping.kf.eqidx = [3 4 9 ];
M_.mapping.pkf.eqidx = [5 6 ];
M_.mapping.cf.eqidx = [7 8 10 ];
M_.mapping.invef.eqidx = [5 8 11 ];
M_.mapping.yf.eqidx = [8 9 23 ];
M_.mapping.labf.eqidx = [3 7 9 10 ];
M_.mapping.wf.eqidx = [1 3 10 ];
M_.mapping.rrf.eqidx = [6 7 ];
M_.mapping.mc.eqidx = [12 21 ];
M_.mapping.zcap.eqidx = [13 15 19 ];
M_.mapping.rk.eqidx = [12 13 14 17 ];
M_.mapping.k.eqidx = [14 15 20 ];
M_.mapping.pk.eqidx = [16 17 ];
M_.mapping.c.eqidx = [18 19 22 35 ];
M_.mapping.inve.eqidx = [16 19 33 36 ];
M_.mapping.y.eqidx = [19 20 23 34 ];
M_.mapping.lab.eqidx = [14 18 20 22 40 ];
M_.mapping.pinf.eqidx = [17 18 21 22 23 38 ];
M_.mapping.w.eqidx = [12 14 22 37 ];
M_.mapping.r.eqidx = [17 18 23 39 ];
M_.mapping.a.eqidx = [1 9 12 20 24 ];
M_.mapping.b.eqidx = [6 7 17 18 25 ];
M_.mapping.g.eqidx = [8 19 26 ];
M_.mapping.qs.eqidx = [5 11 16 27 33 ];
M_.mapping.ms.eqidx = [23 28 ];
M_.mapping.spinf.eqidx = [21 29 ];
M_.mapping.sw.eqidx = [22 31 ];
M_.mapping.kpf.eqidx = [4 11 ];
M_.mapping.kp.eqidx = [15 33 ];
M_.mapping.ea.eqidx = [24 26 ];
M_.mapping.eb.eqidx = [25 ];
M_.mapping.eg.eqidx = [26 ];
M_.mapping.eqs.eqidx = [27 ];
M_.mapping.em.eqidx = [28 ];
M_.mapping.epinf.eqidx = [30 ];
M_.mapping.ew.eqidx = [32 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 9;
M_.block_structure.block(1).mfs = 9;
M_.block_structure.block(1).equation = [ 24 25 26 27 28 30 32 29 31];
M_.block_structure.block(1).variable = [ 32 33 34 35 36 9 8 37 38];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 20;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 11;
M_.block_structure.block(2).mfs = 10;
M_.block_structure.block(2).equation = [ 9 1 3 4 7 11 5 8 10 2 6];
M_.block_structure.block(2).variable = [ 16 18 12 10 19 39 15 14 17 11 13];
M_.block_structure.block(2).is_linear = true;
M_.block_structure.block(2).NNZDerivatives = 38;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [5 6 7 0 11 12 13 14 15 16 17 18 19 20 26 27 28 29 30 ];
M_.block_structure.block(3).Simulation_Type = 8;
M_.block_structure.block(3).endo_nbr = 13;
M_.block_structure.block(3).mfs = 12;
M_.block_structure.block(3).equation = [ 12 15 19 20 23 33 16 18 21 22 13 14 17];
M_.block_structure.block(3).variable = [ 20 23 21 27 31 40 26 25 29 30 22 28 24];
M_.block_structure.block(3).is_linear = true;
M_.block_structure.block(3).NNZDerivatives = 55;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [3 4 5 6 7 8 9 0 13 14 15 16 17 18 19 20 21 22 23 24 30 31 32 33 34 35 36 ];
M_.block_structure.block(4).Simulation_Type = 1;
M_.block_structure.block(4).endo_nbr = 7;
M_.block_structure.block(4).mfs = 7;
M_.block_structure.block(4).equation = [ 38 39 40 37 36 35 34];
M_.block_structure.block(4).variable = [ 3 2 1 7 6 5 4];
M_.block_structure.block(4).is_linear = true;
M_.block_structure.block(4).NNZDerivatives = 7;
M_.block_structure.block(4).bytecode_jacob_cols_to_sparse = [8 9 10 11 12 13 14 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([3 5 6 4 8 1 2 8 2 3 7 3 7 9 4 10 5 5 6 7 4 7 8 2 4 7 8 1 2 9 6 10 6 4 4 10 10 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([5 5 6 7 7 11 11 11 12 12 12 13 13 13 14 14 15 16 16 16 17 17 17 18 18 18 18 19 19 19 20 20 26 27 28 29 30 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 1 1 1 3 4 6 6 6 6 9 12 15 17 18 21 24 28 31 33 33 33 33 33 33 34 35 36 37 38 ]);
M_.block_structure.block(3).g1_sparse_rowval = int32([4 4 1 5 6 7 9 8 9 9 1 3 11 1 2 10 2 3 4 4 7 12 5 2 5 6 2 7 9 4 8 9 8 9 11 8 10 11 3 7 9 11 6 12 6 7 7 8 9 12 9 12 7 12 ]);
M_.block_structure.block(3).g1_sparse_colval = int32([3 4 5 5 6 7 7 8 8 9 13 13 13 14 14 14 15 15 15 16 16 16 17 18 18 18 19 19 19 20 20 20 21 21 21 22 22 22 23 23 23 23 24 24 30 31 32 32 32 32 33 34 35 36 ]);
M_.block_structure.block(3).g1_sparse_colptr = int32([1 1 1 2 3 5 6 8 10 11 11 11 11 14 17 20 23 24 27 30 33 36 39 43 45 45 45 45 45 45 46 47 51 52 53 54 55 ]);
M_.block_structure.block(4).g1_sparse_rowval = int32([]);
M_.block_structure.block(4).g1_sparse_colval = int32([]);
M_.block_structure.block(4).g1_sparse_colptr = int32([]);
M_.block_structure.variable_reordered = [ 32 33 34 35 36 9 8 37 38 16 18 12 10 19 39 15 14 17 11 13 20 23 21 27 31 40 26 25 29 30 22 28 24 3 2 1 7 6 5 4];
M_.block_structure.equation_reordered = [ 24 25 26 27 28 30 32 29 31 9 1 3 4 7 11 5 8 10 2 6 12 15 19 20 23 33 16 18 21 22 13 14 17 38 39 40 37 36 35 34];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 4 39;
 5 15;
 7 14;
 10 14;
 11 39;
 15 40;
 16 26;
 18 25;
 21 29;
 22 25;
 22 29;
 22 30;
 23 16;
 23 27;
 23 31;
 24 32;
 25 33;
 26 34;
 27 35;
 28 36;
 29 9;
 29 37;
 31 8;
 31 38;
 33 40;
 34 27;
 35 25;
 36 26;
 37 30;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 11;
 1 18;
 1 32;
 2 10;
 2 11;
 3 11;
 3 12;
 3 17;
 3 18;
 4 10;
 4 12;
 5 13;
 5 15;
 5 35;
 6 13;
 6 19;
 6 33;
 7 14;
 7 17;
 7 19;
 7 33;
 8 10;
 8 14;
 8 15;
 8 16;
 8 34;
 9 12;
 9 16;
 9 17;
 9 32;
 10 14;
 10 17;
 10 18;
 11 15;
 11 35;
 11 39;
 12 20;
 12 22;
 12 30;
 12 32;
 13 21;
 13 22;
 14 22;
 14 23;
 14 28;
 14 30;
 15 21;
 15 23;
 16 24;
 16 26;
 16 35;
 17 24;
 17 31;
 17 33;
 18 25;
 18 28;
 18 31;
 18 33;
 19 21;
 19 25;
 19 26;
 19 27;
 19 34;
 20 23;
 20 27;
 20 28;
 20 32;
 21 20;
 21 29;
 21 37;
 22 25;
 22 28;
 22 29;
 22 30;
 22 38;
 23 16;
 23 27;
 23 29;
 23 31;
 23 36;
 24 32;
 25 33;
 26 34;
 27 35;
 28 36;
 29 9;
 29 37;
 30 9;
 31 8;
 31 38;
 32 8;
 33 26;
 33 35;
 33 40;
 34 4;
 34 27;
 35 5;
 35 25;
 36 6;
 36 26;
 37 7;
 37 30;
 38 3;
 38 29;
 39 2;
 39 31;
 40 1;
 40 28;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 5 15;
 6 11;
 6 13;
 7 14;
 7 17;
 16 26;
 17 22;
 17 24;
 17 29;
 18 25;
 18 28;
 18 29;
 21 29;
 22 29;
 22 30;
];
M_.block_structure.dyn_tmp_nbr = 15;
M_.state_var = [32 33 34 35 36 9 8 37 38 16 39 15 14 27 31 40 26 25 29 30 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(40, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(7, 1);
M_.params = NaN(46, 1);
M_.endo_trends = struct('deflator', cell(40, 1), 'log_deflator', cell(40, 1), 'growth_factor', cell(40, 1), 'log_growth_factor', cell(40, 1));
M_.NNZDerivatives = [160; 0; -1; ];
M_.dynamic_g1_sparse_rowval = int32([31 29 7 10 5 23 18 22 35 16 36 23 34 21 22 22 37 23 24 25 26 27 28 29 31 4 11 15 33 40 39 38 34 35 36 37 31 32 29 30 2 4 8 1 2 3 3 4 9 5 6 7 8 10 5 8 11 8 9 23 3 7 9 10 1 3 10 6 7 12 21 13 15 19 12 13 14 14 15 20 16 17 18 19 22 35 16 19 33 36 19 20 23 34 14 18 20 22 40 21 22 23 38 12 14 22 37 17 18 23 39 1 9 12 20 24 6 7 17 18 25 8 19 26 5 11 16 27 33 23 28 21 29 22 31 11 33 6 6 7 5 7 17 17 18 16 18 17 18 21 22 22 24 26 25 26 27 28 30 32 ]);
M_.dynamic_g1_sparse_colval = int32([8 9 14 14 15 16 25 25 25 26 26 27 27 29 29 30 30 31 32 33 34 35 36 37 38 39 39 40 40 41 42 43 44 45 46 47 48 48 49 49 50 50 50 51 51 51 52 52 52 53 53 54 54 54 55 55 55 56 56 56 57 57 57 57 58 58 58 59 59 60 60 61 61 61 62 62 62 63 63 63 64 64 65 65 65 65 66 66 66 66 67 67 67 67 68 68 68 68 68 69 69 69 69 70 70 70 70 71 71 71 71 72 72 72 72 72 73 73 73 73 73 74 74 74 75 75 75 75 75 76 76 77 77 78 78 79 80 91 93 94 95 97 102 104 105 106 108 109 109 109 109 110 121 121 122 123 124 125 126 127 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 1 1 1 1 1 2 3 3 3 3 3 5 6 7 7 7 7 7 7 7 7 7 10 12 14 14 16 18 19 20 21 22 23 24 25 26 28 30 31 32 33 34 35 36 37 39 41 44 47 50 52 55 58 61 65 68 70 72 75 78 81 83 87 91 95 100 104 108 112 117 122 125 130 132 134 136 137 138 138 138 138 138 138 138 138 138 138 138 139 139 140 141 142 142 143 143 143 143 143 144 144 145 146 147 147 148 152 153 153 153 153 153 153 153 153 153 153 153 155 156 157 158 159 160 161 ]);
M_.dynamic_g2_sparse_indices = int32([]);
M_.lhs = {
'a'; 
'zcapf'; 
'rkf'; 
'kf'; 
'invef'; 
'pkf'; 
'cf'; 
'yf'; 
'yf'; 
'wf'; 
'kpf'; 
'mc'; 
'zcap'; 
'rk'; 
'k'; 
'inve'; 
'pk'; 
'c'; 
'y'; 
'y'; 
'pinf'; 
'w'; 
'r'; 
'a'; 
'b'; 
'g'; 
'qs'; 
'ms'; 
'spinf'; 
'epinfma'; 
'sw'; 
'ewma'; 
'kp'; 
'dy'; 
'dc'; 
'dinve'; 
'dw'; 
'pinfobs'; 
'robs'; 
'labobs'; 
};
M_.static_tmp_nbr = [17; 2; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 24];
M_.block_structure_stat.block(1).variable = [ 32];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 25];
M_.block_structure_stat.block(2).variable = [ 33];
M_.block_structure_stat.block(3).Simulation_Type = 3;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 26];
M_.block_structure_stat.block(3).variable = [ 34];
M_.block_structure_stat.block(4).Simulation_Type = 3;
M_.block_structure_stat.block(4).endo_nbr = 1;
M_.block_structure_stat.block(4).mfs = 1;
M_.block_structure_stat.block(4).equation = [ 27];
M_.block_structure_stat.block(4).variable = [ 35];
M_.block_structure_stat.block(5).Simulation_Type = 3;
M_.block_structure_stat.block(5).endo_nbr = 1;
M_.block_structure_stat.block(5).mfs = 1;
M_.block_structure_stat.block(5).equation = [ 28];
M_.block_structure_stat.block(5).variable = [ 36];
M_.block_structure_stat.block(6).Simulation_Type = 1;
M_.block_structure_stat.block(6).endo_nbr = 6;
M_.block_structure_stat.block(6).mfs = 6;
M_.block_structure_stat.block(6).equation = [ 30 32 34 35 36 37];
M_.block_structure_stat.block(6).variable = [ 9 8 4 5 6 7];
M_.block_structure_stat.block(7).Simulation_Type = 3;
M_.block_structure_stat.block(7).endo_nbr = 1;
M_.block_structure_stat.block(7).mfs = 1;
M_.block_structure_stat.block(7).equation = [ 29];
M_.block_structure_stat.block(7).variable = [ 37];
M_.block_structure_stat.block(8).Simulation_Type = 3;
M_.block_structure_stat.block(8).endo_nbr = 1;
M_.block_structure_stat.block(8).mfs = 1;
M_.block_structure_stat.block(8).equation = [ 31];
M_.block_structure_stat.block(8).variable = [ 38];
M_.block_structure_stat.block(9).Simulation_Type = 6;
M_.block_structure_stat.block(9).endo_nbr = 11;
M_.block_structure_stat.block(9).mfs = 11;
M_.block_structure_stat.block(9).equation = [ 1 2 3 4 5 6 7 8 9 10 11];
M_.block_structure_stat.block(9).variable = [ 18 10 12 39 13 11 19 16 17 14 15];
M_.block_structure_stat.block(10).Simulation_Type = 6;
M_.block_structure_stat.block(10).endo_nbr = 13;
M_.block_structure_stat.block(10).mfs = 13;
M_.block_structure_stat.block(10).equation = [ 14 15 16 17 18 19 20 21 22 23 12 13 33];
M_.block_structure_stat.block(10).variable = [ 28 40 24 22 29 27 23 20 25 31 30 21 26];
M_.block_structure_stat.block(11).Simulation_Type = 1;
M_.block_structure_stat.block(11).endo_nbr = 3;
M_.block_structure_stat.block(11).mfs = 3;
M_.block_structure_stat.block(11).equation = [ 40 39 38];
M_.block_structure_stat.block(11).variable = [ 1 2 3];
M_.block_structure_stat.variable_reordered = [ 32 33 34 35 36 9 8 4 5 6 7 37 38 18 10 12 39 13 11 19 16 17 14 15 28 40 24 22 29 27 23 20 25 31 30 21 26 1 2 3];
M_.block_structure_stat.equation_reordered = [ 24 25 26 27 28 30 32 34 35 36 37 29 31 1 2 3 4 5 6 7 8 9 10 11 14 15 16 17 18 19 20 21 22 23 12 13 33 40 39 38];
M_.block_structure_stat.incidence.sparse_IM = [
 1 11;
 1 18;
 1 32;
 2 10;
 2 11;
 3 11;
 3 12;
 3 17;
 3 18;
 4 10;
 4 12;
 4 39;
 5 13;
 5 35;
 6 11;
 6 13;
 6 19;
 6 33;
 7 14;
 7 19;
 7 33;
 8 10;
 8 14;
 8 15;
 8 16;
 8 34;
 9 12;
 9 16;
 9 17;
 9 32;
 10 14;
 10 17;
 10 18;
 11 15;
 11 35;
 11 39;
 12 20;
 12 22;
 12 30;
 12 32;
 13 21;
 13 22;
 14 22;
 14 23;
 14 28;
 14 30;
 15 21;
 15 23;
 15 40;
 16 24;
 16 35;
 17 22;
 17 24;
 17 29;
 17 31;
 17 33;
 18 25;
 18 29;
 18 31;
 18 33;
 19 21;
 19 25;
 19 26;
 19 27;
 19 34;
 20 23;
 20 27;
 20 28;
 20 32;
 21 20;
 21 29;
 21 37;
 22 25;
 22 28;
 22 29;
 22 30;
 22 38;
 23 16;
 23 27;
 23 29;
 23 31;
 23 36;
 24 32;
 25 33;
 26 34;
 27 35;
 28 36;
 29 9;
 29 37;
 30 9;
 31 8;
 31 38;
 32 8;
 33 26;
 33 35;
 33 40;
 34 4;
 35 5;
 36 6;
 37 7;
 38 3;
 38 29;
 39 2;
 39 31;
 40 1;
 40 28;
];
M_.block_structure_stat.tmp_nbr = 12;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(5).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(6).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(6).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(6).g1_sparse_colptr = int32([]);
M_.block_structure_stat.block(7).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(7).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(7).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(8).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(8).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(8).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(9).g1_sparse_rowval = int32([1 3 10 2 4 8 3 4 9 4 11 5 6 1 2 3 6 6 7 8 9 3 9 10 7 8 10 8 11 ]);
M_.block_structure_stat.block(9).g1_sparse_colval = int32([1 1 1 2 2 2 3 3 3 4 4 5 5 6 6 6 6 7 7 8 8 9 9 9 10 10 10 11 11 ]);
M_.block_structure_stat.block(9).g1_sparse_colptr = int32([1 4 7 10 12 14 18 20 22 25 28 30 ]);
M_.block_structure_stat.block(10).g1_sparse_rowval = int32([1 7 9 2 13 3 4 1 4 11 12 4 5 8 9 10 6 7 10 1 2 7 8 11 5 6 9 4 5 10 1 9 11 2 6 12 6 13 ]);
M_.block_structure_stat.block(10).g1_sparse_colval = int32([1 1 1 2 2 3 3 4 4 4 4 5 5 5 5 5 6 6 6 7 7 7 8 8 9 9 9 10 10 10 11 11 11 12 12 12 13 13 ]);
M_.block_structure_stat.block(10).g1_sparse_colptr = int32([1 4 6 8 12 17 20 23 25 28 31 34 37 39 ]);
M_.block_structure_stat.block(11).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(11).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(11).g1_sparse_colptr = int32([]);
M_.static_g1_sparse_rowval = int32([40 39 38 34 35 36 37 31 32 29 30 2 4 8 1 2 3 6 3 4 9 5 6 7 8 10 8 11 8 9 23 3 9 10 1 3 10 6 7 12 21 13 15 19 12 13 14 17 14 15 20 16 17 18 19 22 19 33 19 20 23 14 20 22 40 17 18 21 22 23 38 12 14 22 17 18 23 39 1 9 12 20 24 6 7 17 18 25 8 19 26 5 11 16 27 33 23 28 21 29 22 31 4 11 15 33 ]);
M_.static_g1_sparse_colval = int32([1 2 3 4 5 6 7 8 8 9 9 10 10 10 11 11 11 11 12 12 12 13 13 14 14 14 15 15 16 16 16 17 17 17 18 18 18 19 19 20 20 21 21 21 22 22 22 22 23 23 23 24 24 25 25 25 26 26 27 27 27 28 28 28 28 29 29 29 29 29 29 30 30 30 31 31 31 31 32 32 32 32 32 33 33 33 33 33 34 34 34 35 35 35 35 35 36 36 37 37 38 38 39 39 40 40 ]);
M_.static_g1_sparse_colptr = int32([1 2 3 4 5 6 7 8 10 12 15 19 22 24 27 29 32 35 38 40 42 45 49 52 54 57 59 62 66 72 75 79 84 89 92 97 99 101 103 105 107 ]);
M_.params(15) = 0;
ccs = M_.params(15);
M_.params(16) = 0;
cinvs = M_.params(16);
M_.params(24) = 0;
crdpi = M_.params(24);
M_.params(12) = .025;
ctou = M_.params(12);
M_.params(23) = 1.5;
clandaw = M_.params(23);
M_.params(39) = 0.18;
cg = M_.params(39);
M_.params(3) = 10;
curvp = M_.params(3);
M_.params(1) = 10;
curvw = M_.params(1);
M_.params(9) = .24;
calfa = M_.params(9);
cbeta=.9995;
M_.params(13) = 1.5;
csigma = M_.params(13);
M_.params(17) = 1.5;
cfc = M_.params(17);
M_.params(2) = 0.51;
cgy = M_.params(2);
M_.params(11) = 6.0144;
csadjcost = M_.params(11);
M_.params(14) = 0.6361;
chabb = M_.params(14);
M_.params(19) = 0.8087;
cprobw = M_.params(19);
M_.params(22) = 1.9423;
csigl = M_.params(22);
M_.params(21) = 0.6;
cprobp = M_.params(21);
M_.params(18) = 0.3243;
cindw = M_.params(18);
M_.params(20) = 0.47;
cindp = M_.params(20);
M_.params(10) = 0.2696;
czcap = M_.params(10);
M_.params(25) = 1.488;
crpi = M_.params(25);
M_.params(28) = 0.8762;
crr = M_.params(28);
M_.params(27) = 0.0593;
cry = M_.params(27);
M_.params(26) = 0.2347;
crdy = M_.params(26);
M_.params(29) = 0.9977;
crhoa = M_.params(29);
M_.params(31) = 0.5799;
crhob = M_.params(31);
M_.params(32) = 0.9957;
crhog = M_.params(32);
M_.params(33) = 0.9928;
crhols = M_.params(33);
M_.params(34) = 0.7165;
crhoqs = M_.params(34);
M_.params(30) = 1;
crhoas = M_.params(30);
M_.params(35) = 0;
crhoms = M_.params(35);
M_.params(36) = 0;
crhopinf = M_.params(36);
M_.params(37) = 0;
crhow = M_.params(37);
M_.params(8) = 0;
cmap = M_.params(8);
M_.params(7) = 0;
cmaw = M_.params(7);
M_.params(4) = 0;
constelab = M_.params(4);
M_.params(5) = 0.7;
constepinf = M_.params(5);
M_.params(6) = 0.7420;
constebeta = M_.params(6);
M_.params(38) = 0.3982;
ctrend = M_.params(38);
load('Smets_Wouters_2007_results_org.mat','estim_params_','bayestopt_')
load('x_endo_param','total_x')
xdone=total_x;
for i = 1:length(xdone)
parameter_index=estim_params_.param_vals(i,1);
paramname = char(deblank(M_.param_names(parameter_index,:)));
eval(['set_param_value(paramname,xdone(' int2str(i) '));']);
end
load('x_shock_std','x_std')
set_param_value('sea',x_std(1));
set_param_value('seb',x_std(2));
set_param_value('seg',x_std(3));
set_param_value('seqs',x_std(4));
set_param_value('sem',x_std(5));
set_param_value('sepinf',x_std(6));
set_param_value('sew',x_std(7));
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.Sigma_e(3, 3) = (1)^2;
M_.Sigma_e(4, 4) = (1)^2;
M_.Sigma_e(5, 5) = (1)^2;
M_.Sigma_e(6, 6) = (1)^2;
M_.Sigma_e(7, 7) = (1)^2;
if isempty(estim_params_)
    estim_params_.var_exo = zeros(0, 10);
    estim_params_.var_endo = zeros(0, 10);
    estim_params_.corrx = zeros(0, 11);
    estim_params_.corrn = zeros(0, 11);
    estim_params_.param_vals = zeros(0, 10);
end
if ~isempty(find(estim_params_.var_exo(:,1)==1))
    error('The standard deviation for ea has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.var_exo = [estim_params_.var_exo; 1, 0.4618, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.var_exo(:,1)==2))
    error('The standard deviation for eb has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.var_exo = [estim_params_.var_exo; 2, 0.1818513, 0.025, 5, 4, 0.1, 2, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.var_exo(:,1)==3))
    error('The standard deviation for eg has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.var_exo = [estim_params_.var_exo; 3, 0.6090, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.var_exo(:,1)==4))
    error('The standard deviation for eqs has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.var_exo = [estim_params_.var_exo; 4, 0.46017, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.var_exo(:,1)==5))
    error('The standard deviation for em has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.var_exo = [estim_params_.var_exo; 5, 0.2397, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.var_exo(:,1)==6))
    error('The standard deviation for epinf has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.var_exo = [estim_params_.var_exo; 6, 0.1455, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.var_exo(:,1)==7))
    error('The standard deviation for ew has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.var_exo = [estim_params_.var_exo; 7, 0.2089, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==29))
    error('Parameter crhoa has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 29, .9676, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==31))
    error('Parameter crhob has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 31, .2703, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==32))
    error('Parameter crhog has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 32, .9930, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==34))
    error('Parameter crhoqs has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 34, .5724, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==35))
    error('Parameter crhoms has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 35, .3, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==36))
    error('Parameter crhopinf has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 36, .8692, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==37))
    error('Parameter crhow has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 37, .9546, .001, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==8))
    error('Parameter cmap has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 8, .7652, 0.01, .9999, 1, 0.5, 0.2, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==7))
    error('Parameter cmaw has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 7, .8936, 0.01, .9999, 1, 0.5, 0.2, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==11))
    error('Parameter csadjcost has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 11, 6.3325, 2, 15, 3, 4, 1.5, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==13))
    error('Parameter csigma has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 13, 1.2312, 0.25, 3, 3, 1.50, 0.375, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==14))
    error('Parameter chabb has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 14, 0.7205, 0.001, 0.99, 1, 0.7, 0.1, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==19))
    error('Parameter cprobw has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 19, 0.7937, 0.3, 0.95, 1, 0.5, 0.1, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==22))
    error('Parameter csigl has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 22, 2.8401, 0.25, 10, 3, 2, 0.75, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==21))
    error('Parameter cprobp has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 21, 0.7813, 0.5, 0.95, 1, 0.5, 0.10, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==18))
    error('Parameter cindw has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 18, 0.4425, 0.01, 0.99, 1, 0.5, 0.15, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==20))
    error('Parameter cindp has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 20, 0.3291, 0.01, 0.99, 1, 0.5, 0.15, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==10))
    error('Parameter czcap has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 10, 0.2648, 0.01, 1, 1, 0.5, 0.15, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==17))
    error('Parameter cfc has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 17, 1.4672, 1.0, 3, 3, 1.25, 0.125, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==25))
    error('Parameter crpi has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 25, 1.7985, 1.0, 3, 3, 1.5, 0.25, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==28))
    error('Parameter crr has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 28, 0.8258, 0.5, 0.975, 1, 0.75, 0.10, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==27))
    error('Parameter cry has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 27, 0.0893, 0.001, 0.5, 3, 0.125, 0.05, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==26))
    error('Parameter crdy has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 26, 0.2239, 0.001, 0.5, 3, 0.125, 0.05, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==5))
    error('Parameter constepinf has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 5, 0.7, 0.1, 2.0, 2, 0.625, 0.1, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==6))
    error('Parameter constebeta has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 6, 0.7420, 0.01, 2.0, 2, 0.25, 0.1, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==4))
    error('Parameter constelab has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 4, 1.2918, (-10.0), 10.0, 3, 0.0, 2.0, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==38))
    error('Parameter ctrend has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 38, 0.3982, 0.1, 0.8, 3, 0.4, 0.10, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==2))
    error('Parameter cgy has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 2, 0.05, 0.01, 2.0, 3, 0.5, 0.25, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==9))
    error('Parameter calfa has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 9, 0.24, 0.01, 1.0, 3, 0.3, 0.05, NaN, NaN, NaN ];
options_.irf = 0;
options_.nocorr = true;
options_.nodecomposition = true;
options_.nofunctions = true;
options_.nograph = true;
options_.noprint = true;
options_.order = 2;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
if isempty(options_.qz_criterium)
options_.qz_criterium = 1+1e-6;
end
var_list = M_.endo_names(1:M_.orig_endo_nbr);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'Smets_Wouters_2007_std_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Smets_Wouters_2007_std_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Smets_Wouters_2007_std_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Smets_Wouters_2007_std_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Smets_Wouters_2007_std_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Smets_Wouters_2007_std_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Smets_Wouters_2007_std_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Smets_Wouters_2007_std_results.mat'], 'options_mom_', '-append');
end
disp('Note: 33 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
