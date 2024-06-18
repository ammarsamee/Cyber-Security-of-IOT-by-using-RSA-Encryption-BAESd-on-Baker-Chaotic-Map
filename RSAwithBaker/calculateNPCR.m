function npcrValue = calculateNPCR(image1, image2)
    diff = image1 ~= image2;
    npcrValue = sum(diff(:)) / numel(image1) * 100;
end