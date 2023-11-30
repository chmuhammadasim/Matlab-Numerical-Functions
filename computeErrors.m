function [absErr, relErr, perErr] = computeErrors(approxVal, actVal)
    absErr = abs(actVal - approxVal);
    relErr = absErr / abs(actVal);
    perErr = relErr*100;
    fprintf('Act Val: %.3f \n', actVal);
    fprintf('Approx Val: %.3f \n', approxVal);
    fprintf('Abs Err: %.3f \n', absErr);
    fprintf('Rel Err: %.3f \n', relErr);
    fprintf('Per Err: %.3f% %\n', perErr);
end
