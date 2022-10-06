alphas = [0.001,0.005:0.005:1];
ss = [0:0.05:1];

ss_id = 19;
ss(ss_id) % 0.9

[AA, SS] = meshgrid(alphas, ss);

asc = zeros(3, length(ss), length(alphas));
desc = zeros(3, length(ss), length(alphas));

asc_mask = zeros(length(ss), length(alphas));
desc_mask = zeros(length(ss), length(alphas));

for s_id=1:length(ss)
	str1 = sprintf('./results_asc/op_%d.mat', s_id);
	op_st = load(str1);
	op_asc = op_st.mat1;
	asc(:, s_id, :) = op_asc(:, :);
	
	ddm = diff(diff(op_asc(1, :)));
	id_asc = find(ddm < -1e-5, 1, 'first');
	asc_mask(s_id, 1:id_asc) = 1;

	str1 = sprintf('./results_desc/op_%d.mat', s_id);
	op_st = load(str1);
	op_desc = op_st.mat1;
	desc(:, s_id, :) = op_desc(:, :);

	ddm = diff(op_desc(1, :), 2);
	id_desc = find(ddm > 1e-5, 1, 'last');
	desc_mask(s_id, id_desc:length(alphas)) = 1;
end

for idx=1:3
	r_asc_tmp = reshape(real(asc(idx, :, :)), length(ss), length(alphas));
	r_desc_tmp = reshape(real(desc(idx, :, :)), length(ss), length(alphas));
	r_asc = asc_mask .* r_asc_tmp + (1-asc_mask) .* r_desc_tmp;
	r_desc = desc_mask .* r_desc_tmp + (1-desc_mask) .* r_asc_tmp;
	%r_asc = r_asc_tmp;
	%r_desc = r_desc_tmp;
	figure
	subplot(4, 2, 1);
	contourf(AA, SS, r_asc, linspace(-0.01, 1, 102), 'LineStyle', 'none');
	colorbar;
	title('asc');

	subplot(4, 2, 2);
	contourf(AA, SS, r_desc, linspace(-0.01, 1, 102), 'LineStyle', 'none');
	colorbar;
	title('desc');

	subplot(4, 2, 3);
	plot(alphas, r_asc);

	subplot(4, 2, 4);
	plot(alphas, r_desc);

	subplot(4, 1, 3);
	contourf(AA, SS, r_desc - r_asc, linspace(-0.01,1,102), 'LineStyle', 'none');
	colorbar;

	subplot(4, 1, 4);
	plot(alphas, r_asc(ss_id, :));
	hold on;
	plot(alphas, r_desc(ss_id, :));
end
