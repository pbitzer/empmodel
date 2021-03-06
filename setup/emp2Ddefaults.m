% default inputs for emp 2D jobs

inputs.exefile = 'emp2d';
inputs.exedir = '/shared/users/ram80/empcodes/emp2/';

inputs.submitjob = 1;  % set to zero just to test setup
inputs.savefields = [1 0 0 0 0 0]; % set to zero if you don't need the large output fields
                                   % six files: E, J, H, K, D, O
                                   % K is Eeff, Ek, heat, S, and Te; 
                                   % D is ne, nO-, nu;
                                   % O is optics for seven emissions
% what planet?
inputs.Re = 6370000;

% do you want to use the PML boundary?
inputs.dopml_top = 1;
inputs.dopml_wall = 1;
% do you want to include the ionosphere?
inputs.doionosphere = 1;
% do you want to calculate ionosphere changes (Ne, etc)?
inputs.doioniz = 1;
% do you want to integrate and spit out the elve movie?
inputs.doelve = 0;
% do you want to do associative detachment?
inputs.dodetach = 1;
% number of times to write to output arrays - evenly distributed
inputs.numfiles = 30;
% highest altitude to consider. Notice everything in meters!
inputs.maxalt = 110e3;
% perfectly conducting ground (0), SIBC (1) or real ground (2)? 
inputs.groundmethod = 1;

% dr below surface (ground)
inputs.dr0 = 20;
%number of ground cells
inputs.nground = 0;
% initial dr from ground up
inputs.dr1 = 200;
% dr at higher altitudes
inputs.dr2 = 200;
% delta in range direction (used to calculate dtheta)
inputs.drange = 200;
% altitude at which to change to smaller dr. If they are the same, it
% doesn't matter.
inputs.stepalt = 70e3;

% lightning location, azimuth sof interest, and range
inputs.Trlat = 38;
inputs.Trlon = -83;
inputs.range = 750e3;
inputs.az = 153;

% time step: use 1e-7 for D-region (good up to 150 km, grids >= 100 m)
inputs.dt = 1e-7;

% conductivities: make them nonzero if you want
inputs.sig = 0;
inputs.sigm = 0;

% camera location, distance from source along ground and altitude
inputs.camdist = 500e3;
inputs.camalt = 0;
inputs.camelev = 9;
inputs.camfov = [36 18];  %% left-right, up-down
inputs.numpixels = [128 64];   %% camera pixels
inputs.cameratype = 'camera';
inputs.elvesteps = 1000;        % number of elve output time steps
% transmitter?
inputs.dotransmitter = 0;
inputs.txf0 = 20e3;
% planet 0 = earth; 1 = venus; 2 = saturn
inputs.planet = 0;  

%decimate outputs before writing. Useful for 100m resolution. Default = 1
inputs.decfactor = 2;

% probe distance for radiation pattern
inputs.probedist = 100e3;

% set up probe points. Define locations in km, then determine grid values
probeangle = linspace(0,90,10);

inputs.proberange = [100 150 200 250 300 350 400 450 500 550 600 650 700] * 1e3;
inputs.probealt = zeros(size(inputs.proberange));

% lightning inputs
inputs.lightningtype = 0;        % 0 = CG, 1 = IC, or 2 = CID
inputs.I0 = 100e3; %e3; % peak current in amperes:
inputs.Ic = 0; %2e3;   % continuing current!
inputs.sourcealt = 8e3; % note that source alt is channel length for CG, altitude of IC
inputs.chlength = 2e3;  % channel length for IC, ignored by CG
inputs.taur = 10e-6;
inputs.tauf = 100e-6;
inputs.rsspeed = -0.75*vp; % for CG, downwards by default; if negative, goes upwards
inputs.decaytype = 1;
% choices: 0 = TL, 1 = MTLL, 2 = MTLE, 3 = BG, 4 = TCS, 5 = DU, 6 = dummy

% filtering for the lightning input
inputs.fcut = 300e3;

% magnetic field
inputs.Bmag = 50000e-9;

% cluster and number of nodes
inputs.cluster = 'batchnew';
inputs.numnodes = '8';

% gravity waves! gwave reaches mag (as DN/N0) at maxalt and then stays
% there. kh is 2*pi/horizontal wavelength.

inputs.dogwave = 0;
inputs.gwavemag = 0.5;
inputs.gwavemaxalt = 100e3;
inputs.gwavekh = 2*pi/20e3;
