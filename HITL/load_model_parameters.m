% script for load model parameters

clc;

g = 9.81; % gravitational accelleration

Ix = 2.353 * exp(-3); % inertia along x-axis
Iy = 2.353 * exp(-3); % inertia along y-axis
Iz = 5.262 * exp(-2); % inertia along z-axis

m = 1.2; % mass

mixer_matrix = [ 1  1  1  1;
                 1 -1  1 -1;
                 1  1 -1 -1;
                 1 -1 -1  1] / 4;

inverse_mixer_matrix = [1  1  1  1;
                        1 -1  1 -1;
                        1  1 -1 -1;
                        1 -1 -1  1];


SampleTime = 0.002;

% parameters for messages creation
m_to_mm = 1000;
ref_height = -71.3232;
ms_to_cms = 100; 

altToPrsGain = 12.0173;
altToPrsBias = 101270.95;

ms2_to_mg = (1/9.80665)*1000;

% lat, long ing@UNIPG
ref_lat = 43.118926;
ref_lon = 12.355420;

uT_to_gauss = 0.0100;