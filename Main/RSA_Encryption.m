% % % % % 
% Rivest-Shamir-Adleman (RSA)
% Ergin Sezgin
% 13/08/2024
% 

% Initialization
cd(fileparts(matlab.desktop.editor.getActiveFilename));
clear; clc;
rng(90);

NET.addAssembly('System.Security');
rsa = System.Security.Cryptography.RSACryptoServiceProvider();

publicKey = rsa.ToXmlString(false); 
privateKey = rsa.ToXmlString(true);

fprintf("Public Key:\n%s\n", publicKey);
fprintf("\nPrivate Key\n%s\n", privateKey);

plainText = '"This is a test data."';
fprintf('\nData to be encrypted:\n%s\n', plainText);
plainBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
rsa.FromXmlString(publicKey);
cipherBytes = rsa.Encrypt(plainBytes, false);

cipherTextHex = reshape(dec2hex(uint8(cipherBytes))', 1, []);
fprintf('\nData encrypted (Hexadecimal):\n%s\n', cipherTextHex);

rsa.FromXmlString(privateKey);
decryptedBytes = rsa.Decrypt(cipherBytes, false);
decryptedText = System.Text.Encoding.UTF8.GetString(decryptedBytes);
fprintf('\nData decrypted:\n%s\n', char(decryptedText));
