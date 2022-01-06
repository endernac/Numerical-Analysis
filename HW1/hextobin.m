% Andrew Cornelio. Feb 5, 2021

% Example: 
% Typing "hextobin('123a')" will return the string "0001001000111010"

function [binvec] = hextobin(hexvec)
% parameter: hexvec, string of hexdigits
% output:   binvec, string of bits
% Converts any n-dimensional vector [h_1,...,h_n] of the values h_i in
% {0,1,2,...,9,a,b,...f}, with the definitions into a vector [b_1,...,b_{4n}]
% of the values b_i in {0,1}.


vec = "";

for h = hexvec
    % check if char is a-f or 0-9 and convert to int8
    if int8(h) > 90
        k = int8(h) - 97 + 10;
    else
        k = int8(h) - 48;
    end
    
    % bitshift and bitmask ints
    b0 = bitand(bitshift(k,-3), 1);
    b1 = bitand(bitshift(k,-2), 1);
    b2 = bitand(bitshift(k,-1), 1);
    b3 = bitand(k, 1);
    
    % form string and concatentate to previous results
    bin = compose("%d%d%d%d", b0, b1, b2, b3);
    vec = strcat(vec, bin);
end

binvec = vec;
end