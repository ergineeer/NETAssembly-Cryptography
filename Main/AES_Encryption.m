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

plainText = '"This is a test data."';
fprintf('\n\nData to be encrypted:\n%s\n', plainText);
plainBytes = System.Text.Encoding.UTF8.GetBytes(plainText);

encryptor = aes.CreateEncryptor();
cipherBytes = encryptor.TransformFinalBlock(plainBytes, 0, plainBytes.Length);
cipherBytesConverted = uint8(cipherBytes);

cipherTextHex = reshape(dec2hex(cipherBytesConverted)', 1, []);
fprintf('\nData encrypted (Hexadecimal):\n%s\n', cipherTextHex);

decryptor = aes.CreateDecryptor();
decryptedBytes = decryptor.TransformFinalBlock(cipherBytes, 0, cipherBytes.Length);
decryptedText = System.Text.Encoding.UTF8.GetString(decryptedBytes);

fprintf('\nData decrypted:\n%s\n', char(decryptedText));
