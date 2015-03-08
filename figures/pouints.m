%% For the 2D Cartesian grid

N = 7;
[xi yi] = meshgrid(1/(N+1):1/(N+1):1-1/(N+1));

figure

interior = [xi(:)'; yi(:)'];
interior = union(interior', [-xi(:)' -xi(:)' xi(:)'; yi(:)' -yi(:)' -yi(:)']', 'rows' )';
scatter(interior(1,:), interior(2,:), 'o', 'MarkerFaceColor', [0 0 0], 'MarkerEdgeColor', [0 0 0] );

bottom = [0:1/(N+1):1; zeros(1,N+2)]';
left = fliplr(bottom);
top = [0:1/(N+1):1; ones(1,N+2)]';
right = fliplr(top);

bdry = union(union(union(bottom,left, 'rows'), top, 'rows'),right, 'rows')';

% The extended boundary points.
bdry = union(union(bdry',-left(2:end-1,:), 'rows'), -bottom(2:end-1,:), 'rows')';
bdry= union(union(bdry', [-top(2:end-1,1) top(2:end-1,2)], 'rows'),...
    [right(2:end-1,1) -right(2:end-1,2)], 'rows' )';

hold on, scatter(bdry(1,:), bdry(2,:), 'o', 'MarkerEdgeColor', [0 0 0] );



% Draw the squares
cube = patch([-1 1 1 -1], [-1 -1 1 1], 'k', 'FaceColor', 'none', 'LineWidth',1, 'LineStyle', '--');
ucube = patch([0 1 1 0], [0 0 1 1], 'k', 'FaceColor', 'none', 'LineWidth',1, 'LineStyle', '-');
axis off
axis equal

% Annotations
%Annotate the point (1,1) and (-1,-1)
text(1,1,'   (1,1)','HorizontalAlignment','left', 'VerticalAlignment','bottom');
text(-1,-1,'(-1,-1)','HorizontalAlignment','right','VerticalAlignment','top');


%% 2D quincunx grid

M = floor(0.5 + 0.25*sqrt(-4 + 8*(N+2)^2));
h = 1/(M-1);

figure

bottom = [0:h:1; zeros(1,M)]';
left = fliplr(bottom);
top = [0:h:1; ones(1,M)]';
right = fliplr(top);


% Boundary points
bdry = union(union(union(bottom,left, 'rows'), top, 'rows'),right, 'rows')';

[xia,yia] = meshgrid(h:h:1-h);
[xib, yib] = meshgrid(h/2:h:1-h/2);
% Interior points
hold on
scatter(xia(:), yia(:), 'o','MarkerEdgeColor', [0 0 0], 'MarkerFaceColor', [0 0 0]);
scatter(xib(:), yib(:), 'o','MarkerEdgeColor', [0 0 0], 'MarkerFaceColor', [0 0 0]);

%Extended interior points
einterior = [-xia(:)' -xia(:)' xia(:)' -xib(:)' -xib(:)' xib(:)';...
    yia(:)' -yia(:)' -yia(:)' yib(:)' -yib(:)' -yib(:)'];
scatter(einterior(1,:), einterior(2,:), 'o','MarkerEdgeColor', [0 0 0], 'MarkerFaceColor', [0 0 0]);

%Extended boundary points
bdry = union(union(bdry', -left(2:end-1,:), 'rows'),-bottom(2:end-1,:), 'rows')';
bdry = union(union(bdry', [-top(2:end-1,1) top(2:end-1,2)], 'rows'),...
    [right(2:end-1,1) -right(2:end-1,2)], 'rows' )';

scatter(bdry(1,:), bdry(2,:), 'o', 'MarkerEdgeColor', [0 0 0] );

% Draw the squares
cube = patch([-1 1 1 -1], [-1 -1 1 1], 'k', 'FaceColor', 'none', 'LineWidth',1, 'LineStyle', '--');
ucube = patch([0 1 1 0], [0 0 1 1], 'k', 'FaceColor', 'none', 'LineWidth',1, 'LineStyle', '-');
axis off
axis equal

% Annotations
%Annotate the point (1,1) and (-1,-1)
text(1,1,'   (1,1)','HorizontalAlignment','left', 'VerticalAlignment','bottom');
text(-1,-1,'(-1,-1)','HorizontalAlignment','right','VerticalAlignment','top');