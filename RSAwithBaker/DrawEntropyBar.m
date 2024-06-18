% قيم الانتروبي للصور الثلاثة في الحالتين
entropy_without_encryption = [7.7624, 7.7502, 6.9593]; % هذه القيم افتراضية، قم باستبدالها بالقيم الحقيقية
entropy_with_encryption = [7.962, 7.9936, 7.5980];   % هذه القيم افتراضية، قم باستبدالها بالقيم الحقيقية

% أسماء الصور
image_names = {'Baboon', 'Lena', 'Airplane'};

% إنشاء الرسم
figure;

% عرض البيانات على شكل بار
bar_width = 0.4;
bar1 = bar((1:3) - bar_width/2, entropy_without_encryption, bar_width, 'b');
hold on;
bar2 = bar((1:3) + bar_width/2, entropy_with_encryption, bar_width, 'r');

% إعداد المحاور وعناوين الرسم
set(gca, 'XTick', 1:3, 'XTickLabel', image_names);
xlabel('Images');
ylabel('Entropy');
title('Entropy Comparison for Images with and without Encryption');
legend('Without Encryption', 'With Encryption');

% تحسين مظهر الرسم
grid on;
hold off;
