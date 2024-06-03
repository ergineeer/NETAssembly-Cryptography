% Initialization
cd(fileparts(matlab.desktop.editor.getActiveFilename))
clear
clc
rng(90)

NET.addAssembly('System.Security');
image = 'ngc6543a.jpg';
img = imread(image);
imgBytes = uint8(img(:));

sha256 = System.Security.Cryptography.SHA256Managed();
hashBytes = uint8(sha256.ComputeHash(imgBytes));

sha256hash = '';
for i = 1:length(hashBytes)
    sha256hash = strcat(sha256hash, lower(dec2hex(hashBytes(i), 2)));
end
disp(['Hash: ', sha256hash]);
