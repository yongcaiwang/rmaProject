% Copyright 2017 Laercio Barbosa
% Author: Laercio Barbosa 
% e-mail: leoabubauru@hotmail.com
% Github: https://github.com/laercio-barbosa/rmaProject
% Date: 31/05/2017
% 
% SLAM frontend for V-REP .
%
% COPYRIGHT INFO
% ==============
% 
% This software was written and developed by Laercio Barbosa as part of an 
% master thesis test in the course Autonomous Mobile Robots from the Instituto de 
% Computa��o e Matem�tica Computacional, University of S�o Paulo, USP, Brazil.
% If you have any questions, I can be contacted at: 
%
% leoabubauru@hotmail.com
% 
% Please feel free to use, modify and distribute the software for personal or 
% research purposes, along with acknowledgement of the author and inclusion of
% this copyright information.
% 
% -------------------------------------------------------------------
% THIS FILE IS DISTRIBUTED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED
% WARRANTY. THE USER WILL USE IT AT HIS/HER OWN RISK. THE ORIGINAL
% AUTHOR, COPPELIA ROBOTICS GMBH AND MATHWORKS WILL NOT BE LIABLE 
% FOR DATA LOSS, DAMAGES, LOSS OF PROFITS OR ANY OTHER KIND OF LOSS
% WHILE USING OR MISUSING THIS SOFTWARE.
% -------------------------------------------------------------------

function [erro, leftMotorHandle, rightMotorHandle] = initMotors(clientID, vrep, leftMotorDescr, rightMotorDescr)
%INITMOTORS Motors initialization
%   Connects to V-REP remote server and gets motors handles

    [erro, leftMotorHandle] = vrep.simxGetObjectHandle(clientID, leftMotorDescr, vrep.simx_opmode_oneshot_wait);
    if (vrep.simx_return_ok == erro)
        disp('Connected to left motor!');
        
        [erro, rightMotorHandle] = vrep.simxGetObjectHandle(clientID, rightMotorDescr, vrep.simx_opmode_oneshot_wait);
        if (vrep.simx_return_ok == erro)
            disp('Connected to right motor!');
        else
            disp('Handle for right motor not found!');
        end
    else
        disp('Handle for left motor not found!');
    end
end

