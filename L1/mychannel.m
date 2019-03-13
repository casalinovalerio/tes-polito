function [out1, out2] = mychannel(x, D, sigma)
    samples = length(x);
    shifted_data = delayseq(x, D);
    WN = sqrt(sigma).*randn(1, samples);
    out1 = shifted_data + WN;
    out2 = shifted_data;
end

