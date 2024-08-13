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
passwordBytes = System.Text.Encoding.UTF8.GetBytes(password);
pbkdf2 = Rfc2898DeriveBytes(passwordBytes, salt, 10000); % 10000 iterations
derivedKey = pbkdf2.GetBytes(32);
derivedKeyBase64 = System.Convert.ToBase64String(derivedKey);
fprintf("Derived Key: %s", char(derivedKeyBase64))
