

% Constants
    % Magnet specifications:
    Br = 13200*10^-4;   % T (N42) refer to: https://www.kjmagnetics.com/specs.asp  AND: https://www.kjmagnetics.com/blog.asp?p=magnet-grade#:~:text=This%20number%20is%20a%20material%20property%20which%20is,more%20Br%20values%20for%20various%20neodymium%20magnet%20grades.
    w = 10*10^-3;       % Width m
    l = 20*10^-3;       % Length m
    t = 1*10^-3;        % Thickness m
    s = 1*10^-3;        % Spacing m

    B_feildStrength = 2*(Br/pi)*(atan((w*l)/(2*s*sqrt(4*s^2 + w^2 + l^2)))-atan((w*l)/(2*(t+s)*sqrt(4*(t+s)^2 + w^2 + l^2))));
    % given formula: https://www.magnet-sdm.com/2017/08/01/magnetic-field-strength-permanent-magnet/
    % confirm with simulator: https://www.adamsmagnetic.com/gauss-and-pull-calculators-for-magnets/?calculator=rectangle

    % Rotor
    Num_magnets = 12;       % num magnets on each rotor
    RotorRadius = 0.05;     % m
    RPM = 100;              % rev/min
    MagnetVelocity = ((2*pi*RotorRadius)*RPM)/60;     % ms^-1
    AngVelocity = RPM*2*pi/60;    %rads^-1



    % Stator
    N = 120;                % turns
    A_coil = 5*10^-4;       % m^2

DeltaT = (2*pi/Num_magnets)/AngVelocity;
%DeltaT = ((2*pi*RotorRadius)/Num_magnets)/MagnetVelocity;
DeltaTheta = 2*B_feildStrength*cos(0)*A_coil;

% EMF per coil
emf = -N*DeltaTheta/DeltaT;     % Voltage
emf_total = 3*emf;              % Voltage in series

disp(emf_total);

