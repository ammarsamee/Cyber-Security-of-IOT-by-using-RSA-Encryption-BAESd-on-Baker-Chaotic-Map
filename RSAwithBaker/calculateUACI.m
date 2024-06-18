function uaciValue = calculateUACI(image1, image2)
    diff = abs(double(image1) - double(image2));
    uaciValue = sum(diff(:)) / numel(image1) / 255 * 100;
end