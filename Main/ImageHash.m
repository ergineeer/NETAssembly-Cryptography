% Initialization
cd(fileparts(matlab.desktop.editor.getActiveFilename))
clear
clc
rng(90) 


%% Method 1 - java.security.MessageDigest.getInstance()
img = imread('ngc6543a.jpg');
imgBytes = typecast(img(:), 'uint8');
md = java.security.MessageDigest.getInstance('SHA-256');
hashBytes_1 = md.digest(imgBytes);
sha256hash_1 = sprintf('%02x', typecast(hashBytes_1, 'uint8'));
disp(['Hash: ', sha256hash_1]);
