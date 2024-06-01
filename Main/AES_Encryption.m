% Initialization
cd(fileparts(matlab.desktop.editor.getActiveFilename))
clear
clc
rng(90)

NET.addAssembly('System.Windows.Forms');
aes = System.Security.Cryptography.AesManaged();

aes.GenerateKey();
aes.GenerateIV();

keyHex = reshape(dec2hex(uint8(aes.Key))', 1, []);
ivHex = reshape(dec2hex(uint8(aes.IV))', 1, []);

fprintf("Key generated (Hexadecimal):\n%s", keyHex);
fprintf("\n\nInitialization vector generated (Hexadecimal)\n%s", ivHex);
