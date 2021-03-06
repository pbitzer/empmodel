%% launch batch of EMP 3D jobs. Use also for single jobs.

clear all; close all;

loadconstants;

% set defaults
emp3Ddefaults;

% anything you want to change?
inputs.submitjob = 1;
inputs.doioniz = 1;
inputs.dodetach = 1;
inputs.doionosphere = 1;
inputs.cluster = 'batch';
inputs.numnodes = '8';

% master directory for set of runs
toprundir = '/shared/users/ram80/empcodes/runs/sourcetest3/';

% variable for batch of runs. name must match an input!
var1.name = 'I0';
var1.values = [100] * 1e3;


% submit jobs

for m = 1:length(var1.values),
    
    % change variables as requested
    evalstr = ['inputs.' var1.name ' = ' num2str(var1.values(m)) ';'];
    eval(evalstr);
    
    inputs.runname = [var1.name '_' sprintf('%03.3g',var1.values(m))];
    inputs.runname(strfind(inputs.runname,'+')) = '';
    inputs.rundir = [toprundir inputs.runname];
    
    % launch job
    [in,jobid] = emp3Drun(inputs);
    
end
