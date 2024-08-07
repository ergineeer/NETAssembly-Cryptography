% Initialization
cd(fileparts(matlab.desktop.editor.getActiveFilename))
clear; clc;
rng(90);


%% Method 1 - java.security.MessageDigest.getInstance()
img = imread('ngc6543a.jpg');
imgBytes = typecast(img(:), 'uint8');
md = java.security.MessageDigest.getInstance('SHA-256');
hashBytes_1 = md.digest(imgBytes);
sha256hash_1 = sprintf('%02x', typecast(hashBytes_1, 'uint8'));
disp(['Hash: ', sha256hash_1]);


%% Method 2 - System.Security.Cryptography.SHA256Managed()
NET.addAssembly('System.Security');
image = 'ngc6543a.jpg';
img = imread(image);
imgBytes = uint8(img(:));
sha256 = System.Security.Cryptography.SHA256Managed();
hashBytes_2 = uint8(sha256.ComputeHash(imgBytes));

sha256hash_2 = '';
for i = 1:length(hashBytes_2)
    sha256hash_2 = strcat(sha256hash_2, lower(dec2hex(hashBytes_2(i), 2)));
end
disp(['Hash: ', sha256hash_2]);


%% Method 3 - System.Security.Cryptography.HashAlgorithm.Create()
NET.addAssembly('System.Security');
imagePath = 'ngc6543a.jpg';
img = imread(imagePath);
imgBytes = uint8(img(:));
% As hashing algorithm, you can use any of the following along with SHA256
% 'SHA1' | 'SHA384' | 'SHA512' | 'MD5'
algorithm = 'SHA256';
hasher = System.Security.Cryptography.HashAlgorithm.Create(algorithm);
hashBytes_3 = uint8(hasher.ComputeHash(imgBytes));

hashStr = '';
for i = 1:length(hashBytes_3)
    hashStr = strcat(hashStr, lower(dec2hex(hashBytes_3(i), 2)));
end
disp(['Hash: ', hashStr]);

    sha256hash_2 = strcat(sha256hash_2, lower(dec2hex(hashBytes_2(i), 2)));
end
disp(['Hash: ', sha256hash_2]);


%% Method Comparison
if strcmp(sha256hash_1, sha256hash_2) && strcmp(sha256hash_2, hashStr)
    fprintf('All three hashes are the same.\n');
else
    fprintf('The hashes are not the same.\n');
end


