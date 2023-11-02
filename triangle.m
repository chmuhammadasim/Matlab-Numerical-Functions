function [area] = triangle(base, height)
    base = 2 ;height = 4;
    area = (1/2) * (base * height);
    fprintf('Area: %d', area);
end