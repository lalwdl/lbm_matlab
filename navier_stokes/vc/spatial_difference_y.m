function ddy = spatial_difference_y(phi,dh)
% fourth-order interior differences, 4-stencil (range 5-stencil).
% fourth-order one-sided one-away-from-boundary distances, 5-stencil.
% second-order one-sided difference on the boundary, 3-stencil.

% indexing in phi(j,i)

ddy = 0*phi;

% now take care of ddy.
% j = 1, 2nd order
ddy(1, :) = ( ...
    -3*phi(1,:) ...
    +4*phi(2,:) ...
    -phi(3,:) ...
    ) / 2 / dh;
% j = 2, 4th order
ddy(2, :) = ( ...
    -3*phi(1,:) ...
    -10*phi(2,:) ...
    +18*phi(3,:) ...
    -6*phi(4,:) ...
    +phi(5,:) ...
    ) / 12 / dh;
% interior
ddy(3:end-2, :) = ( ...
    -phi((3:end-2)+2,:) ...
    +8*phi((3:end-2)+1,:) ...
    -8*phi((3:end-2)-1,:) ...
    +phi((3:end-2)-2,:) ...
    ) / 12 / dh;
% j = end-1, 4th order
ddy(end-1, :) = -( ...
    -3*phi(end,:) ...
    -10*phi(end-1,:) ...
    +18*phi(end-2,:) ...
    -6*phi(end-3,:) ...
    +phi(end-4,:) ...
    ) / 12 / dh;
% j = end, 2nd order
ddy(end,:) = -( ...
    -3*phi(end,:) ...
    +4*phi(end-1,:) ...
    -phi(end-2,:) ...
    ) / 2 / dh;

