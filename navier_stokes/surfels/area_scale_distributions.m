function f = area_scale_distributions(f,fluid_areas)

f(:,2:end,2) = fluid_areas(:,1:end-1) ./ fluid_areas(:,2:end) ...
    .* f(:,2:end,2); % East vector.
f(2:end,:,3) = fluid_areas(1:end-1,:) ./ fluid_areas(2:end,:) ...
    .* f(2:end,:,3); % North vector.
f(:,1:end-1,4) = fluid_areas(:,2:end) ./ fluid_areas(:,1:end-1) .* ...
    f(:,1:end-1,4); % West vector.
f(1:end-1,:,5) = fluid_areas(2:end,:) ./ fluid_areas(1:end-1,:) .* ...
    f(1:end-1,:,5); % South vector.
f(2:end,2:end,6) = fluid_areas(1:end-1,1:end-1) ./ ...
    fluid_areas(2:end,2:end) .* ...
    f(2:end,2:end,6); % Northeast vector.
f(2:end,1:end-1,7) = fluid_areas(1:end-1,2:end) ./ ...
    fluid_areas(2:end,1:end-1) .* ...
    f(2:end,1:end-1,7); % Northwest vector.
f(1:end-1,1:end-1,8) = fluid_areas(2:end,2:end) ./ ...
    fluid_areas(1:end-1,1:end-1) .* ...
    f(1:end-1,1:end-1,8); % Southwest vector.
f(1:end-1,2:end,9) = fluid_areas(2:end,1:end-1) ./ ...
    fluid_areas(1:end-1,2:end) .* ...
    f(1:end-1,2:end,9); % Southeast vector.