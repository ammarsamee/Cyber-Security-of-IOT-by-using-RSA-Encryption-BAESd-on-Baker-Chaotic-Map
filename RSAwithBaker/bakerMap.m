% % Function for chaotic baker map
% function img_out = bakerMap(img_in)
%     [m, n] = size(img_in);
%     img_out = zeros(m, n, 'uint8');
%     for i = 1:m
%         for j = 1:n
%             x = mod((i + j - 2), m) + 1;
%             y = mod((i + 2*j - 2), n) + 1;
%             img_out(x, y) = img_in(i, j);
%         end
%     end
% end
% Function for chaotic baker map
function img_out = bakerMap(img_in)
    [m, n] = size(img_in);
    img_out = zeros(m, n, 'uint8');
    for i = 1:m
        for j = 1:n
            [newRow, newCol] = bakerMapPoint(i, j, m, n);
           img_out(newRow, newCol, :) = img_in(i, j, :);
            
        end
    end
end
function [newRow, newCol] = bakerMapPoint(row, col, totalRows, totalCols)
    if row <= totalRows / 2
        newRow = 2 * row - 1;
        % newCol = col;
    else
        newRow = 2 * (row - totalRows / 2);
        % newCol = col;
    end
    if col <= totalCols / 2
        newCol = 2 * col - 1;
    else
        newCol = 2 * (col - totalCols / 2);
    end
end
