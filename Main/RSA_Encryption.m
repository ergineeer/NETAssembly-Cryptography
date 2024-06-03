% Initialization
cd(fileparts(matlab.desktop.editor.getActiveFilename))
clear
clc
rng(90)

NET.addAssembly('System.Security');
rsa = System.Security.Cryptography.RSACryptoServiceProvider();

publicKey = rsa.ToXmlString(false); 
privateKey = rsa.ToXmlString(true);

fprintf("Public Key:\n%s\n", publicKey);
fprintf("\nPrivate Key\n%s\n", privateKey);

plainText = '"This is a test data."';
fprintf('\nData to be encrypted:\n%s\n', plainText);
plainBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
