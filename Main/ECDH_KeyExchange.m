% % % % % 
% Elliptic Curve Diffie-Hellman (ECDH) Key Exchange
% Ergin Sezgin
% 08/08/2024
% 

% Initialization
cd(fileparts(matlab.desktop.editor.getActiveFilename));
clear; clc;
rng(90);

%% Method 1 - System.Security.Cryptography
import System.Security.Cryptography.*
firstParty = ECDiffieHellmanCng();
secondParty = ECDiffieHellmanCng();
firstPartyPublicKey = firstParty.PublicKey.ToByteArray();
secondPartyPublicKey = secondParty.PublicKey.ToByteArray();

firstPartySharedSecretWithSecond = firstParty.DeriveKeyMaterial(CngKey.Import(secondPartyPublicKey, CngKeyBlobFormat.EccPublicBlob));
secondPartySharedSecretWithFirst = secondParty.DeriveKeyMaterial(CngKey.Import(firstPartyPublicKey, CngKeyBlobFormat.EccPublicBlob));
sharedSecretMatches = isequal(firstPartySharedSecretWithSecond, secondPartySharedSecretWithFirst);

if sharedSecretMatches == 1
    disp('Shared secret matches between parties.');
else
    disp('Shared secret doesn''t match.');
end
