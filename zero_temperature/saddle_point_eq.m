function [out] = saddle_point_eq(op, alpha, s, t0, zz, Dzz)
	U = 1 + op(3,1);
	hatm = alpha ./ U;
	hatq = alpha .* (op(2,1) - 2.*op(1,1) + 1 + t0) ./ U.^2;
	h = s.*(hatm + sqrt(hatq) .* zz);
	G = 1-s;

	denom = sqrt(h.^2 + G.^2);
	it = h ./ denom;

	it(isnan(it)) = 0;

	m = Dzz * it';
	q = Dzz * (it.^2)';
	C = (s .* G.^2) .* (Dzz * (1./denom.^3)');
	if isnan(C)
		C = 0;
	end

	out(1,1) = m - op(1,1);
	out(2,1) = q - op(2,1);
	out(3,1) = C - op(3,1);
end
