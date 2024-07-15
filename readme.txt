Readme

Meyer-Gohde, Alexander and Saecker, Johanna (2024). SOLVING LINEAR DSGE MODELS WITH NEWTON METHODS, Economic Modelling. 
Authors: Alexander Meyer-Gohde, Johanna Saecker, 01/2024
Copyright (C) 2024 Alexander Meyer-Gohde & Johanna Saecker

1. Environment Setting 

Required Software 
• Please install MATLAB to run the matlab files. For MATLAB, the Optimization Toolbox package, the Statistics Toolbox package and the R2019a or newer versions are required. The program was run using Matlab 2022a. 
• Please install Dynare. The program requires Dynare version 5.1, it is assumed that Dynare is installed in the default location
• Please go to https://www.dynare.org/resources/quick_start/ for instructions to set up your Dynare in MATLAB or Octave.  

2. How to run the files?

Part (in paper) 5.1: Smets and Wouters model 
Directory: "policy_experiment" runs the policy experiment
	- run "policy_loop" to create the results
	- run "create_plots" to create the figure 
	- run "make_table" to create the table 

Directory: "improvement_experiment" runs the Smets and Wouters model
            - run file "mmb_loop" to create the results 

Directory: "mmb_experiment" runs the main experiment with the MMB
	- run file "mmb_loop" to create the results
	- run files "SM07_results" and "plot_results" to create the tables and figures 

Part (in paper) 5.2: MMB suite comparison

Directory: "mmb_experiment2" runs the 2nd experiment with the MMB (dynare's solution matrix as a starting guess)
	- run file "mmb_loop" to create the results
	- run file "plot_results" to create the tables and figures

Directory: "mmb_replication" contains the dynare mod-files of all MMB models used

Appendix (in paper: 6.6): den Haan & Marcet test 
Directory: "DHM" runs the den Haan & Marcet test

%------------------------------------------------------------

How to create all figures and tables:

Figure 1:
-run "policy_loop" in folder "policy_experiment"
-run "create_plots" in same folder

Figure 2:
-run "mmb_loop" in the folder "mmb_experiment" 
-run "histograms" in same folder 

Figure 3:
-run "mmb_loop" in the folder "mmb_experiment2" 
-run "plot_results" in folder "mmb_experiment2"

Figures 4-6: 
-run "mmb_loop" in the folder "mmb_experiment" 
-run "plot_results" in same folder

Table 1:
-run "policy_loop" in folder "policy_experiment"
-run "make_table" in same folder

Table 2:
-run "mmb_loop" in the folder "mmb_experiment" 
-run "SM07_results" in same folder

Table 3: 
-run "mmb_loop" in folder "improvement_experiment"
-run "disp_results" in same folder

Table 4: 
-run "mmb_loop" in the folder "mmb_experiment2" 
-run "plot_results" in same folder

Table 5: 
-run "mmb_loop" in the folder "mmb_experiment" 
-run "plot_results" in same folder 

Appendix figures 6.5 (Figures 7 + 8): 
-run "mmb_loop" in the folder "mmb_experiment" 
-run "plot_results" in same folder

Appendix figures 6.6 (Figure 9, table 6): 
-run "plot_results" in the folder "DHM"

