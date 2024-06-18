function corrValue = calculateCorrelationCoefficient(image)
    [rows, cols] = size(image);
    x = image(1:rows-1, 1:cols-1);
    y = image(2:rows, 2:cols);
    corrValue = corr2(x, y);
end