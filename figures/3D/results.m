%% The scale
NCC = [16 32 64 128 256 512];

for i = 1:numel(NCC)
    hlabel{i} = num2str(1/(NCC(i)+1), '%10.2e');
end
    


% Number of BCC samples are determined so that CC and BCC have roughly the
% same number of samples
NBCC = floor((1 + NCC) ./ 2^(1/3));

% Cube root of Number of interior BCC samples
NBint = (NBCC.^3 + (NBCC-1).^3).^(1/3);



%% All the extracted data
% CC Results

ccLinearL2 = [1.798246E+01, 2.739709E-01, 5.081497E-02, 1.210899E-02, 2.995014E-03, 7.494486E-04];
ccLinearLinf = [2.852765E+01, 1.734704E+00, 2.728010E-01, 6.142977E-02, 1.490395E-02, 3.766861E-03];

ccNnL2 = [1.827384E+01, 6.879408E-01, 2.656328E-01, 1.259476E-01, 6.237209E-02, 3.120521E-02];
ccNnLinf = [3.001269E+01, 3.060601E+00, 1.026051E+00, 5.076488E-01, 2.535835E-01, 1.288413E-01];

ccCubicL2 = [1.816727E+01, 1.876446E-01, 1.114738E-02, 8.801522E-04, 5.888934E-05, 3.789409E-06];
ccCubicLinf = [2.918992E+01, 1.098612E+00, 7.470030E-02, 5.309981E-03, 3.633388E-04, 2.328647E-05];

ccQcubicL2 = [1.816755E+01, 1.793499E-01, 4.965959E-03, 1.503652E-04, 6.630578E-06, 3.944909E-07];
ccQcubicLinf = [2.919649E+01, 9.890588E-01, 4.574515E-02, 1.391657E-03, 5.928562E-05, 3.215544E-06];

% BCC results

bccLinearL2 = [1.953174E+00, 1.980518E-01, 4.417511E-02, 1.065992E-02, 2.670024E-03, 6.620786E-04];
bccLinearLinf = [7.502254E+00, 1.666201E+00, 4.362832E-01, 1.139844E-01, 2.817720E-02, 7.015853E-03];

bccNnL2 = [2.977381E+00, 6.074716E-01, 2.572200E-01, 1.226481E-01, 6.087096E-02, 3.027945E-02];
bccNnLinf = [8.581025E+00, 2.169503E+00, 1.104132E+00, 5.458423E-01, 2.745858E-01, 1.379032E-01];

bccQuinticL2 = [2.113013E+00, 7.731170E-02, 7.183797E-03, 5.153476E-04, 3.406612E-05, 2.127966E-06];
bccQuinticLinf = [7.595310E+00, 3.407941E-01, 2.290585E-02, 1.578277E-03, 1.033852E-04, 6.426692E-06];


bccQquinticL2 = [2.167662E+00, 6.990666E-02, 2.327418E-03, 7.105014E-05, 3.624671E-06, 2.160353E-07];
bccQquinticLinf = [7.909260E+00, 4.208501E-01, 1.550573E-02, 7.705793E-04, 4.363098E-05, 2.664548E-06];


%% Plot the L2 results
figure
loglog(NCC, ccNnL2, 'g.-.', 'LineWidth', 1.0, 'MarkerSize', 10);
hold on
loglog(NCC, ccLinearL2, 'b.-.', 'LineWidth', 1.0, 'MarkerSize', 10);
loglog(NCC, ccCubicL2, 'r.-.', 'LineWidth', 1.0, 'MarkerSize', 10);
loglog(NCC, ccQcubicL2, 'm.-.', 'LineWidth', 1.0, 'MarkerSize', 10);

loglog(NBint, bccNnL2, 'g.-', 'LineWidth', 1.0, 'MarkerSize', 10);
loglog(NBint, bccLinearL2, 'b.-', 'LineWidth', 1.0, 'MarkerSize', 10);
loglog(NBint, bccQuinticL2, 'r.-', 'LineWidth', 1.0, 'MarkerSize', 10);
loglog(NBint, bccQquinticL2, 'm.-', 'LineWidth', 1.0, 'MarkerSize', 10);


set(gca, 'XGrid', 'on');
legend('CC nearest', 'CC trilinear','CC tricubic', 'CC quasi-trbicubic', ...
    'BCC nearest', 'BCC linear','BCC quintic', 'BCC quasi-quintic',...
    'Location', 'SouthWest');
legend('boxoff')
set(gca, 'XTick', NCC);
xlabel('M')
ylabel('$L_{2}$ error')
axis square
axis tight

% also plot a different unit on the top axis
%h1 = gca;
%ax=axis;
%h2=axes('position',get(h1,'position'));
%set(h2,'color','none')
%axis([NCC(1) NCC(end) ax(3) ax(4)]);
%set(h2,'XAxisLocation','top');
%set(h2,'XTick', NCC(1):((NCC(end)-NCC(1))/(numel(NCC)-1)):NCC(end));
%set(h2,'xticklabel',hlabel);
%set(h2,'YAxisLocation','right');
%set(h2,'YTick', 0);
%set(h2,'yticklabel',{});
%set(h2, 'xlabel', 'h');
%set([h1 h2],'box','off');

%% Plot the Linf results

figure
loglog(NCC, ccNnLinf, 'g.-.', 'LineWidth', 1.2, 'MarkerSize', 10);
hold on
loglog(NCC, ccLinearLinf, 'b.-.', 'LineWidth', 1.2, 'MarkerSize', 10);
loglog(NCC, ccCubicLinf, 'r.-.', 'LineWidth', 1.2, 'MarkerSize', 10);
loglog(NCC, ccQcubicLinf, 'm.-.', 'LineWidth', 1.2, 'MarkerSize', 10);

loglog(NBint, bccNnLinf, 'g.-', 'LineWidth', 1.2, 'MarkerSize', 10);
loglog(NBint, bccLinearLinf, 'b.-', 'LineWidth', 1.2, 'MarkerSize', 10);
loglog(NBint, bccQuinticLinf, 'r.-', 'LineWidth', 1.2, 'MarkerSize', 10);
loglog(NBint, bccQquinticLinf, 'm.-', 'LineWidth', 1.2, 'MarkerSize', 10);

axis square
axis tight
set(gca, 'XGrid', 'on');
set(gca, 'XTick', NCC);
xlabel('M')
ylabel('$L_{inf}$ error')
hold all;

