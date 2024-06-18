% % Function for inverse baker map
% function img_out = inverseBakerMap(img_in)
%     [m, n] = size(img_in);
%     img_out = zeros(m, n, 'uint8');  % Preserve the same size and type as input
% 
%     for i = 1:m
%         for j = 1:n
%             x = mod((i - j + m), m) + 1;
%             y = mod((2 * j - i + n), n) + 1;
%             img_out(i, j) = img_in(x, y);
%         end
%     end
% end
% Function for inverse baker map
function img_out = inverseBakerMap(img_in)
    [m, n] = size(img_in);
    img_out = zeros(m, n, 'uint8');  % Preserve the same size and type as input
  for i = 1:m
        for j = 1:n
            [origRow, origCol] = inverseBakerMapPoint(i, j, m, n);
            img_out(origRow, origCol, :) = img_in(i, j, :);
        end
    end
end
function [origRow, origCol] = inverseBakerMapPoint(row, col, totalRows, totalCols)
    if row <= totalRows
        if mod(row, 2) == 1
            origRow = (row + 1) / 2;
        else
            origRow = row / 2 + totalRows / 2;
        end
    end
    if col <= totalCols
        if mod(col, 2) == 1
            origCol = (col + 1) / 2;
        else
            origCol = col / 2 + totalCols / 2;
        end
    end
end


