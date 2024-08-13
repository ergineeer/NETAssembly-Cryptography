% % % % % 
% Password-Based Encryption (PBE)
% Ergin Sezgin
% 13/08/2024
% 

%% Initialization
cd(fileparts(matlab.desktop.editor.getActiveFilename));
clear; clc;
rng(90);

%% Main Code
import System.Security.Cryptography.*
password = 'RandomPassword';
salt = System.Text.Encoding.UTF8.GetBytes('random_salt');
