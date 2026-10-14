import 'package:flutter/material.dart';

void main() => runApp(const NabdApp());

class NabdApp extends StatelessWidget {
  const NabdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'صحتي العلاجية',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF168C83),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F8F8),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: Color(0xFFF5F8F8),
          surfaceTintColor: Colors.transparent,
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: Color(0xFFE3EBEA)),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HealthIssue {
  final String name;
  final String summary;
  final String symptoms;
  final String care;
  final String treatment;
  final String urgency;
  final String sourceNote;

  const HealthIssue({
    required this.name,
    required this.summary,
    required this.symptoms,
    required this.care,
    required this.treatment,
    required this.urgency,
    required this.sourceNote,
  });
}

class BodyPart {
  final String name;
  final String system;
  final String location;
  final String function;
  final String description;
  final List<HealthIssue> issues;

  const BodyPart({
    required this.name,
    required this.system,
    required this.location,
    required this.function,
    required this.description,
    required this.issues,
  });
}

const commonWarning =
    'هذه معلومات تثقيفية عامة وليست تشخيصًا أو وصفة علاجية. تختلف الرعاية المناسبة بحسب العمر والحالة الصحية والأدوية الأخرى.';

const issuePain = HealthIssue(
  name: 'ألم أو انزعاج غير محدد',
  summary: 'الألم عرض له أسباب متعددة، ولا يمكن تحديد السبب من مكان الألم وحده.',
  symptoms: 'قد يكون الألم مستمرًا أو متقطعًا، وقد يصاحبه تورم أو حرارة أو ضعف أو أعراض أخرى.',
  care: 'سجّل وقت البداية وشدة الألم وما يزيده أو يخففه. تجنب إجهاد المنطقة، ولا تؤخر التقييم إذا كان الألم شديدًا أو يتفاقم.',
  treatment: 'يعتمد العلاج على السبب بعد التقييم. لا تبدأ دواءً جديدًا أو تكرر المسكنات دون التأكد من ملاءمتها لك.',
  urgency: 'اطلب المساعدة العاجلة عند الألم المفاجئ الشديد، أو صعوبة التنفس، أو الإغماء، أو النزف الشديد، أو الضعف المفاجئ.',
  sourceNote: 'محتوى تمهيدي عام؛ يلزم ربط كل حالة لاحقًا بمصدر طبي محدد ومراجعته.',
);

const issueSprain = HealthIssue(
  name: 'إجهاد أو التواء محتمل',
  summary: 'قد تنتج إصابة الأنسجة الرخوة عن حركة مفاجئة أو تحميل زائد، لكن الكسور قد تشبه الالتواء.',
  symptoms: 'ألم بعد إصابة، تورم أو كدمات، وصعوبة في تحريك المنطقة أو تحميل الوزن عليها.',
  care: 'أوقف النشاط الذي سبب الإصابة، واحمِ المنطقة. يمكن استخدام كمادة باردة ملفوفة بقماش لفترات قصيرة. لا تضع الثلج مباشرة على الجلد.',
  treatment: 'تعتمد الخطة على شدة الإصابة. اطلب فحصًا إذا تعذر تحميل الوزن، أو وُجد تشوه أو خدر أو ألم شديد، أو لم تتحسن الحالة.',
  urgency: 'التشوه، أو برودة الطرف أو تغير لونه، أو الخدر الجديد، أو الألم الشديد بعد الإصابة يستدعي تقييمًا عاجلًا.',
  sourceNote: 'إرشادات أولية عامة وليست بديلًا عن فحص الإصابة.',
);

const issueInflammation = HealthIssue(
  name: 'التهاب محتمل',
  summary: 'الالتهاب قد يحدث بسبب عدوى أو إصابة أو مرض مناعي أو أسباب أخرى؛ ولا يعني دائمًا وجود عدوى.',
  symptoms: 'قد تشمل العلامات الألم أو التورم أو الاحمرار أو السخونة أو تغير الوظيفة، بحسب النسيج المصاب.',
  care: 'راقب الأعراض وتجنب تهييج المنطقة. لا تستخدم المضادات الحيوية أو الكورتيزون من تلقاء نفسك.',
  treatment: 'يعتمد العلاج على السبب؛ فقد يحتاج الأمر إلى فحص أو تحاليل أو علاج مخصص. لا يمكن اختيار العلاج من كلمة «التهاب» وحدها.',
  urgency: 'اطلب تقييمًا عاجلًا إذا ترافق الاحمرار أو التورم مع حمى شديدة أو تدهور سريع أو ألم شديد أو صعوبة في التنفس.',
  sourceNote: 'محتوى تثقيفي عام، ويحتاج كل تشخيص محدد إلى مصدر طبي موثق.',
);

const issueFracture = HealthIssue(
  name: 'كسر محتمل',
  summary: 'قد يحدث الكسر بعد سقوط أو ضربة، ولا يمكن تأكيده من الأعراض وحدها.',
  symptoms: 'ألم وتورم وكدمات وصعوبة استخدام الطرف؛ وقد يظهر تشوه، لكن غياب التشوه لا ينفي الكسر.',
  care: 'ثبّت المنطقة قدر الإمكان في وضع مريح ولا تحاول إعادة العظم إلى مكانه. لا تحمّل الوزن على الطرف المصاب.',
  treatment: 'يحتاج الاشتباه بالكسر إلى تقييم طبي وتصوير عند اللزوم. قد يتطلب التثبيت أو إجراءات أخرى بحسب نوع الكسر.',
  urgency: 'اطلب الرعاية العاجلة عند وجود جرح عميق أو عظم ظاهر أو تشوه أو خدر أو تغير لون الطرف.',
  sourceNote: 'إرشادات إسعافية عامة وليست خطة علاج للكسر.',
);

const issueHeadache = HealthIssue(
  name: 'صداع',
  summary: 'للصداع أسباب كثيرة، من الشائعة والبسيطة إلى الحالات التي تحتاج إلى تقييم عاجل.',
  symptoms: 'ألم في الرأس بدرجات ومواقع مختلفة، وقد يصاحبه غثيان أو حساسية للضوء بحسب السبب.',
  care: 'استرح في مكان هادئ، واشرب الماء إذا كان ذلك مناسبًا، وسجّل وقت البداية والأعراض المصاحبة. تجنب الإفراط في المسكنات.',
  treatment: 'يعتمد العلاج على نوع الصداع وسببه وتاريخك الصحي. الصداع الجديد أو المتكرر يحتاج إلى تقييم طبي.',
  urgency: 'الصداع المفاجئ الذي يبلغ أقصى شدته بسرعة، أو المصحوب بضعف أو اضطراب كلام أو حمى مع تيبس الرقبة أو إصابة رأس، يستدعي الطوارئ.',
  sourceNote: 'معلومات عامة؛ لا يمكن تحديد نوع الصداع من هذه الصفحة وحدها.',
);

const issueBreathing = HealthIssue(
  name: 'ضيق التنفس',
  summary: 'ضيق التنفس قد ينتج عن مشكلات في الرئة أو القلب أو أسباب أخرى، وقد يكون طارئًا.',
  symptoms: 'الشعور بعدم القدرة على أخذ نفس كافٍ، أو التنفس السريع، أو صعوبة الكلام بسبب النفس.',
  care: 'أوقف المجهود واجلس بوضع مريح. لا تنتظر إكمال أي استبيان داخل التطبيق إذا كانت الأعراض شديدة.',
  treatment: 'يحتاج السبب إلى تقييم طبي. لا تستخدم دواء شخص آخر ولا تغيّر علاجًا موصوفًا من دون توجيه طبي.',
  urgency: 'ضيق التنفس الشديد أو المفاجئ، أو ازرقاق الشفتين، أو ألم الصدر، أو الإغماء يستدعي الاتصال بالطوارئ فورًا.',
  sourceNote: 'تنبيه سلامة عام؛ لا يستخدم التطبيق لتأخير طلب المساعدة.',
);

const issueChestPain = HealthIssue(
  name: 'ألم الصدر',
  summary: 'قد يكون ألم الصدر ناتجًا عن أسباب متعددة، وبعضها خطير ولا يمكن استبعاده منزليًا.',
  symptoms: 'ضغط أو ألم أو حرقة أو انزعاج في الصدر، وقد يمتد إلى الذراع أو الفك أو الظهر.',
  care: 'أوقف النشاط واطلب المساعدة عند الألم الجديد أو غير المفسر، خاصة إذا ترافق مع تعرق أو غثيان أو ضيق نفس.',
  treatment: 'لا يمكن تحديد العلاج قبل تقييم السبب. لا تفترض أن الألم ناتج عن الحموضة أو العضلات دون تقييم مناسب.',
  urgency: 'الألم الشديد أو الجديد أو المستمر، خصوصًا مع ضيق النفس أو التعرق أو الإغماء، يستدعي الطوارئ فورًا.',
  sourceNote: 'معلومات أمان عامة؛ لا تشخّص هذه الصفحة سبب الألم.',
);

const issueStomach = HealthIssue(
  name: 'اضطراب أو ألم بطني',
  summary: 'ألم البطن قد يرتبط بالجهاز الهضمي أو المسالك البولية أو أسباب أخرى.',
  symptoms: 'مغص أو انتفاخ أو غثيان أو تغير في التبرز، وقد تختلف العلامات بحسب السبب.',
  care: 'لاحظ موضع الألم ومدته والأعراض المصاحبة. تجنب الأطعمة التي تزيد الانزعاج، ولا تستخدم علاجًا عشوائيًا إذا كان الألم شديدًا.',
  treatment: 'يعتمد العلاج على السبب. قد يحتاج الألم المستمر أو المتكرر إلى فحص سريري أو تحاليل.',
  urgency: 'اطلب الرعاية العاجلة عند ألم شديد أو متزايد، أو قيء دموي، أو براز أسود أو دموي، أو إغماء، أو بطن متصلب.',
  sourceNote: 'إرشادات عامة؛ لا تستبدل التقييم الطبي.',
);

const issueSkin = HealthIssue(
  name: 'تغير جلدي أو طفح',
  summary: 'قد ينشأ الطفح من تهيج أو حساسية أو عدوى أو أسباب أخرى.',
  symptoms: 'احمرار أو حكة أو بقع أو بثور أو تقشر، مع اختلاف الشكل والانتشار بحسب السبب.',
  care: 'تجنب المنتجات الجديدة والمهيجات المعروفة، ولا تحك الجلد أو تفقع البثور. التقط صورة لمتابعة التغير إن كان ذلك مناسبًا.',
  treatment: 'يعتمد العلاج على السبب والمظهر والتاريخ الصحي. لا تستخدم كريمات قوية أو مضادات حيوية موضعية دون إرشاد مناسب.',
  urgency: 'اطلب المساعدة العاجلة إذا صاحبه تورم اللسان أو صعوبة التنفس، أو انتشر بسرعة مع حمى أو ألم شديد.',
  sourceNote: 'معلومات تثقيفية عامة؛ التشخيص الجلدي قد يحتاج إلى فحص.',
);

const issueJoint = HealthIssue(
  name: 'ألم المفصل',
  summary: 'قد ينتج ألم المفصل عن إصابة أو إجهاد أو التهاب أو حالات أخرى.',
  symptoms: 'ألم عند الحركة أو التيبس أو التورم أو محدودية الحركة.',
  care: 'خفف النشاط الذي يزيد الألم وتجنب إجبار المفصل على الحركة. لا تثبّت المفصل لفترة طويلة إلا بتوجيه طبي.',
  treatment: 'يعتمد العلاج على السبب. التورم الحاد أو المفصل الساخن جدًا أو الألم الشديد يحتاج إلى تقييم سريع.',
  urgency: 'اطلب تقييمًا عاجلًا إذا كان المفصل أحمر وساخنًا مع حمى، أو تعذر تحريكه أو تحميل الوزن بعد إصابة.',
  sourceNote: 'إرشادات عامة لا تحدد سبب ألم المفصل.',
);

const issueEye = HealthIssue(
  name: 'تهيج أو ألم العين',
  summary: 'قد يكون السبب جفافًا أو تهيجًا أو عدوى أو إصابة أو مشكلة أخرى.',
  symptoms: 'احمرار أو دموع أو حكة أو ألم أو حساسية للضوء أو تغير في الرؤية.',
  care: 'لا تفرك العين. إذا دخلت مادة كيميائية إلى العين، اغسلها فورًا بكمية كبيرة من الماء النظيف واطلب إرشادًا طبيًا عاجلًا.',
  treatment: 'يعتمد العلاج على السبب. لا تستخدم قطرات تحتوي على مضاد حيوي أو كورتيزون دون توجيه مختص.',
  urgency: 'فقدان الرؤية أو الألم الشديد أو إصابة نافذة أو التعرض لمادة كيميائية يستدعي رعاية عاجلة.',
  sourceNote: 'معلومات أمان عامة؛ مشكلات العين قد تحتاج إلى فحص سريع.',
);

const issueDental = HealthIssue(
  name: 'ألم الأسنان أو اللثة',
  summary: 'قد يرتبط الألم بتسوس أو التهاب لثة أو مشكلة في عصب السن أو أسباب أخرى.',
  symptoms: 'ألم عند المضغ أو حساسية للحرارة والبرودة أو تورم أو نزف اللثة.',
  care: 'حافظ على تنظيف لطيف للفم وتجنب وضع الأسبرين أو مواد كيميائية مباشرة على السن أو اللثة.',
  treatment: 'احجز تقييمًا لدى طبيب الأسنان؛ علاج السبب قد يتطلب إجراءً سنيًا ولا تكفي المسكنات وحدها.',
  urgency: 'تورم الوجه أو الرقبة مع حمى أو صعوبة البلع أو التنفس يستدعي رعاية عاجلة.',
  sourceNote: 'معلومات عامة ولا تحل محل فحص الأسنان.',
);

const issueUrinary = HealthIssue(
  name: 'أعراض بولية',
  summary: 'قد ترتبط الأعراض البولية بالعدوى أو الحصوات أو مشكلات أخرى.',
  symptoms: 'حرقة أو تكرار التبول أو ألم أسفل البطن أو تغير لون البول.',
  care: 'سجّل الأعراض ومدتها والأدوية المستخدمة. لا تبدأ مضادًا حيويًا من دون تقييم.',
  treatment: 'يعتمد العلاج على السبب وقد يحتاج إلى تحليل بول أو فحوصات أخرى.',
  urgency: 'اطلب تقييمًا سريعًا عند وجود حمى مع ألم الخاصرة، أو دم واضح في البول، أو تعذر التبول، أو تدهور عام.',
  sourceNote: 'معلومات تثقيفية عامة؛ لا تؤكد وجود عدوى.',
);

const issueNumbness = HealthIssue(
  name: 'خدر أو تنميل',
  summary: 'قد ينجم التنميل عن ضغط على عصب أو أسباب عصبية أو استقلابية أو دورانية.',
  symptoms: 'وخز أو نقص الإحساس أو إحساس يشبه الإبر في منطقة من الجسم.',
  care: 'لاحظ وقت البداية ومكان التنميل وما إذا كان يتغير مع الوضعية. لا تتجاهل التنميل المستمر أو المتكرر.',
  treatment: 'يعتمد العلاج على السبب، وقد يلزم فحص عصبي أو تحاليل.',
  urgency: 'الخدر المفاجئ في جانب واحد، أو المصحوب بضعف أو اضطراب كلام أو توازن، يستدعي الطوارئ فورًا.',
  sourceNote: 'معلومات عامة وليست تشخيصًا عصبيًا.',
);

const issueFever = HealthIssue(
  name: 'حمّى أو ارتفاع حرارة',
  summary: 'الحمى علامة قد ترافق العدوى أو حالات أخرى، ويختلف التعامل معها حسب العمر والأعراض.',
  symptoms: 'ارتفاع مقاس في حرارة الجسم، وقد يصاحبه قشعريرة أو تعب أو آلام.',
  care: 'قِس الحرارة بميزان موثوق، واهتم بالسوائل والراحة إذا كان الشخص قادرًا على الشرب. لا تعطِ الأطفال أدوية عشوائية.',
  treatment: 'يعتمد العلاج على السبب والعمر والحالة الصحية. الحمى عند الرضع الصغار تستلزم تقييمًا طبيًا عاجلًا.',
  urgency: 'اطلب الرعاية عند صعوبة التنفس أو التشوش أو تيبس الرقبة أو الجفاف الشديد أو التدهور السريع.',
  sourceNote: 'إرشادات عامة؛ تختلف الحدود والتوصيات حسب العمر والحالة.',
);

const issueBack = HealthIssue(
  name: 'ألم الظهر',
  summary: 'ألم الظهر شائع وله أسباب متعددة، وغالبًا ما يحتاج التقييم بحسب شدته والأعراض المصاحبة.',
  symptoms: 'ألم أو تيبس في الظهر، وقد يمتد إلى الساق في بعض الحالات.',
  care: 'تجنب حمل الأوزان الثقيلة مؤقتًا، وحافظ على حركة لطيفة ضمن حدود التحمل بدل ملازمة الفراش طويلًا.',
  treatment: 'تعتمد الخطة على السبب. الألم المستمر أو المتكرر أو الذي يتبع إصابة يحتاج إلى تقييم.',
  urgency: 'ضعف الساقين الجديد أو فقدان التحكم بالمثانة أو الأمعاء أو خدر منطقة العجان يستدعي الطوارئ.',
  sourceNote: 'معلومات عامة ولا تحدد سبب ألم الظهر.',
);

const issueEar = HealthIssue(
  name: 'ألم أو انسداد الأذن',
  summary: 'قد ينتج عن التهاب أو شمع أو تغير الضغط أو أسباب أخرى.',
  symptoms: 'ألم أو إحساس بالامتلاء أو ضعف السمع أو إفرازات أو دوار.',
  care: 'لا تدخل أعوادًا أو أجسامًا في قناة الأذن، ولا تضع قطرات إذا كان هناك احتمال ثقب بالطبلة إلا بتوجيه طبي.',
  treatment: 'يعتمد العلاج على السبب. فقدان السمع المفاجئ يحتاج إلى تقييم عاجل.',
  urgency: 'اطلب رعاية عاجلة عند فقدان سمع مفاجئ، أو تورم خلف الأذن مع حمى، أو دوار شديد مع أعراض عصبية.',
  sourceNote: 'معلومات عامة وليست تشخيصًا للأذن.',
);

const issueCough = HealthIssue(
  name: 'سعال',
  summary: 'قد يكون السعال مرتبطًا بعدوى تنفسية أو حساسية أو ربو أو أسباب أخرى.',
  symptoms: 'سعال جاف أو مصحوب ببلغم، وقد يصاحبه احتقان أو حمى.',
  care: 'تجنب التدخين والدخان، وراقب مدة السعال والأعراض المصاحبة. لا تستخدم المضادات الحيوية دون تقييم.',
  treatment: 'يعتمد العلاج على السبب والعمر والحالة الصحية. السعال الطويل أو المتفاقم يحتاج إلى تقييم.',
  urgency: 'اطلب مساعدة عاجلة عند ضيق التنفس الشديد أو ازرقاق الشفتين أو سعال الدم بكميات ملحوظة أو ألم الصدر الشديد.',
  sourceNote: 'معلومات تثقيفية عامة.',
);

const issueDigestive = HealthIssue(
  name: 'اضطراب هضمي',
  summary: 'قد يشمل عسر الهضم أو الغثيان أو الانتفاخ أو تغير حركة الأمعاء، ولكل منها أسباب مختلفة.',
  symptoms: 'امتلاء أو غثيان أو انتفاخ أو تغير في التبرز.',
  care: 'سجّل الأطعمة والأعراض، وتناول الطعام ببطء، واطلب المشورة إذا استمرت المشكلة أو تكررت.',
  treatment: 'يحدد العلاج بحسب السبب. تجنب الحميات القاسية أو الأدوية المتعددة دون مشورة.',
  urgency: 'ألم شديد أو قيء متكرر مع جفاف أو دم في القيء أو البراز يستدعي تقييمًا عاجلًا.',
  sourceNote: 'إرشادات عامة لا تستبدل التشخيص.',
);

const issueMuscle = HealthIssue(
  name: 'شد عضلي محتمل',
  summary: 'قد يحدث الشد العضلي بسبب جهد أو حركة مفاجئة، لكن الألم قد تكون له أسباب أخرى.',
  symptoms: 'ألم موضعي أو تقلص أو حساسية عند الحركة.',
  care: 'خفف النشاط مؤقتًا، وتحرك بلطف ضمن حدود الألم. أوقف التمرين إذا زاد الألم.',
  treatment: 'غالبًا يعتمد التدبير على شدة المشكلة، لكن الألم الشديد أو المستمر أو المصحوب بضعف يحتاج إلى تقييم.',
  urgency: 'اطلب المساعدة عند ضعف مفاجئ أو تورم شديد أو بول داكن بعد مجهود شديد.',
  sourceNote: 'معلومات عامة وليست تأكيدًا لتشخيص الشد.',
);

const issueGeneral = HealthIssue(
  name: 'مشكلة صحية محتملة',
  summary: 'قد تتأثر هذه البنية بأمراض وإصابات مختلفة. لا يمكن تحديد مشكلة بعينها دون تفاصيل وفحص مناسب.',
  symptoms: 'تختلف الأعراض حسب الحالة والسبب.',
  care: 'راقب الأعراض، وتجنب العلاج العشوائي، واستشر مختصًا إذا استمرت المشكلة أو أثرت في الوظيفة اليومية.',
  treatment: 'لا توجد خطة علاج واحدة تناسب جميع المشكلات. يحتاج العلاج إلى تحديد السبب وتقييم الحالة الفردية.',
  urgency: 'الأعراض المفاجئة أو الشديدة أو المتفاقمة، أو أي علامة طوارئ، تستدعي الرعاية الطبية المناسبة.',
  sourceNote: 'مدخل توعوي عام ينتظر ربطه بمرجع سريري محدد قبل استخدامه كإرشاد لحالة بعينها.',
);

const bodyParts = <BodyPart>[
  BodyPart(
    name: 'الدماغ',
    system: 'الجهاز العصبي',
    location: 'الرأس',
    function: 'تنظيم الحركة والإحساس والتفكير والذاكرة ووظائف الجسم الحيوية.',
    description: 'عضو رئيسي في الجهاز العصبي المركزي.',
    issues: [
      issueHeadache,
      issueNumbness,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الجمجمة',
    system: 'الهيكل العظمي',
    location: 'الرأس',
    function: 'تحمي الدماغ وتدعم تراكيب الوجه.',
    description: 'مجموعة عظام تحيط بالدماغ وتكوّن جزءًا من هيكل الوجه.',
    issues: [
      issueFracture,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'العين',
    system: 'الجهاز البصري',
    location: 'الرأس',
    function: 'استقبال الضوء والمساهمة في الرؤية.',
    description: 'عضو حسي يحتاج إلى عناية خاصة عند الإصابة أو تغير الرؤية.',
    issues: [
      issueEye,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الأذن',
    system: 'الجهاز السمعي والتوازن',
    location: 'الرأس',
    function: 'السمع والمساهمة في التوازن.',
    description: 'تتكون من أجزاء خارجية ووسطى وداخلية.',
    issues: [
      issueEar,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الأنف والجيوب',
    system: 'الجهاز التنفسي',
    location: 'الرأس',
    function: 'ترشيح الهواء وترطيبه والمساهمة في الشم.',
    description: 'تراكيب تساعد على مرور الهواء والإحساس بالروائح.',
    issues: [
      issueCough,
      issueInflammation,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الفم والأسنان',
    system: 'الجهاز الهضمي',
    location: 'الرأس',
    function: 'المضغ وبدء الهضم والكلام.',
    description: 'يشمل الأسنان واللثة واللسان وبطانة الفم.',
    issues: [
      issueDental,
      issueInflammation,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'اللسان',
    system: 'الجهاز الهضمي',
    location: 'الفم',
    function: 'التذوق والمساعدة في المضغ والبلع والكلام.',
    description: 'عضو عضلي مغطى بغشاء مخاطي.',
    issues: [
      issuePain,
      issueInflammation,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الغدة الدرقية',
    system: 'جهاز الغدد الصماء',
    location: 'مقدمة الرقبة',
    function: 'إنتاج هرمونات تساعد على تنظيم الاستقلاب.',
    description: 'غدة تؤثر هرموناتها في وظائف عديدة بالجسم.',
    issues: [
      issueGeneral,
      issueInflammation,
    ],
  ),
  BodyPart(
    name: 'الحنجرة',
    system: 'الجهاز التنفسي',
    location: 'الرقبة',
    function: 'المساعدة في إنتاج الصوت وحماية مجرى التنفس.',
    description: 'تضم الأحبال الصوتية وتشارك في مرور الهواء.',
    issues: [
      issueCough,
      issueInflammation,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'القصبة الهوائية',
    system: 'الجهاز التنفسي',
    location: 'الرقبة والصدر',
    function: 'نقل الهواء نحو الشعب الهوائية.',
    description: 'مجرى هوائي مدعوم بحلقات غضروفية.',
    issues: [
      issueCough,
      issueBreathing,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'القلب',
    system: 'الجهاز الدوري',
    location: 'الصدر',
    function: 'ضخ الدم إلى الرئتين وبقية الجسم.',
    description: 'عضلة تضخ الدم عبر الدورة الدموية.',
    issues: [
      issueChestPain,
      issueBreathing,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الرئتان',
    system: 'الجهاز التنفسي',
    location: 'الصدر',
    function: 'تبادل الأكسجين وثاني أكسيد الكربون.',
    description: 'عضوان أساسيان للتنفس.',
    issues: [
      issueBreathing,
      issueCough,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الأضلاع',
    system: 'الهيكل العظمي',
    location: 'القفص الصدري',
    function: 'حماية أعضاء الصدر والمساعدة في التنفس.',
    description: 'عظام منحنية تشكل معظم القفص الصدري.',
    issues: [
      issueFracture,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'عظم القص',
    system: 'الهيكل العظمي',
    location: 'منتصف الصدر',
    function: 'يتصل بأجزاء من الأضلاع ويشارك في حماية الصدر.',
    description: 'عظم مسطح في مقدمة القفص الصدري.',
    issues: [
      issueFracture,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'العمود الفقري',
    system: 'الهيكل العظمي',
    location: 'الظهر',
    function: 'دعم الجسم وحماية الحبل الشوكي.',
    description: 'سلسلة من الفقرات والأقراص والمفاصل والأربطة.',
    issues: [
      issueBack,
      issueFracture,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الحبل الشوكي',
    system: 'الجهاز العصبي',
    location: 'داخل العمود الفقري',
    function: 'نقل الإشارات بين الدماغ والجسم والمساهمة في المنعكسات.',
    description: 'نسيج عصبي حساس محمي بالفقرات.',
    issues: [
      issueNumbness,
      issueBack,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'المعدة',
    system: 'الجهاز الهضمي',
    location: 'أعلى البطن',
    function: 'خلط الطعام وبدء هضم مكوناته.',
    description: 'عضو عضلي مجوف ضمن الجهاز الهضمي.',
    issues: [
      issueStomach,
      issueDigestive,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الكبد',
    system: 'الجهاز الهضمي والاستقلاب',
    location: 'أعلى يمين البطن',
    function: 'معالجة المغذيات وإنتاج الصفراء والمساهمة في إزالة مواد من الدم.',
    description: 'أحد أكبر أعضاء الجسم الداخلية.',
    issues: [
      issueStomach,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'المرارة',
    system: 'الجهاز الهضمي',
    location: 'أسفل الكبد',
    function: 'تخزين الصفراء وتركيزها.',
    description: 'كيس صغير يخزن الصفراء للمساعدة في هضم الدهون.',
    issues: [
      issueStomach,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'البنكرياس',
    system: 'الجهاز الهضمي والغدد الصماء',
    location: 'أعلى البطن',
    function: 'إنتاج إنزيمات هضمية وهرمونات منها الإنسولين.',
    description: 'غدة تؤدي وظائف هضمية وهرمونية.',
    issues: [
      issueStomach,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الأمعاء الدقيقة',
    system: 'الجهاز الهضمي',
    location: 'البطن',
    function: 'امتصاص معظم المغذيات.',
    description: 'جزء طويل من القناة الهضمية.',
    issues: [
      issueStomach,
      issueDigestive,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الأمعاء الغليظة',
    system: 'الجهاز الهضمي',
    location: 'البطن والحوض',
    function: 'امتصاص الماء وتكوين البراز.',
    description: 'تشمل القولون والمستقيم.',
    issues: [
      issueStomach,
      issueDigestive,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الزائدة الدودية',
    system: 'الجهاز الهضمي',
    location: 'أسفل يمين البطن',
    function: 'نسيج مرتبط بالمناعة المعوية، ووظيفتها ليست أساسية للهضم.',
    description: 'امتداد صغير متصل بالأعور.',
    issues: [
      issueStomach,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الكليتان',
    system: 'الجهاز البولي',
    location: 'جانبا الظهر أعلى البطن',
    function: 'تنقية الدم وتنظيم السوائل والأملاح والمساهمة في تنظيم ضغط الدم.',
    description: 'عضوان يساهمان في تكوين البول.',
    issues: [
      issueUrinary,
      issueBack,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'المثانة',
    system: 'الجهاز البولي',
    location: 'الحوض',
    function: 'تخزين البول قبل إخراجه.',
    description: 'عضو عضلي قابل للتمدد.',
    issues: [
      issueUrinary,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الحالبان',
    system: 'الجهاز البولي',
    location: 'بين الكليتين والمثانة',
    function: 'نقل البول إلى المثانة.',
    description: 'أنبوبان عضليان ينقلان البول.',
    issues: [
      issueUrinary,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الحوض',
    system: 'الهيكل العظمي',
    location: 'أسفل الجذع',
    function: 'نقل وزن الجذع إلى الطرفين السفليين وحماية أعضاء الحوض.',
    description: 'حلقة عظمية تتكون من عظام متصلة ومفاصل.',
    issues: [
      issueFracture,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'مفصل الورك',
    system: 'الجهاز الحركي',
    location: 'بين الحوض والفخذ',
    function: 'تحمل الوزن وتتيح حركة الساق.',
    description: 'مفصل كروي حُقّي قوي.',
    issues: [
      issueJoint,
      issueFracture,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'عظم الفخذ',
    system: 'الهيكل العظمي',
    location: 'الفخذ',
    function: 'حمل الوزن والمساهمة في الحركة.',
    description: 'أطول عظام الجسم وأقواها عادةً.',
    issues: [
      issueFracture,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'مفصل الركبة',
    system: 'الجهاز الحركي',
    location: 'بين الفخذ والساق',
    function: 'يسمح بثني الساق ومدها وتحمل الوزن.',
    description: 'مفصل تدعمه أربطة وغضاريف وعضلات.',
    issues: [
      issueJoint,
      issueSprain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'عظم الظنبوب',
    system: 'الهيكل العظمي',
    location: 'مقدمة الساق',
    function: 'تحمل جزء كبير من وزن الجسم.',
    description: 'العظم الأكبر في الساق أسفل الركبة.',
    issues: [
      issueFracture,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'عظم الشظية',
    system: 'الهيكل العظمي',
    location: 'الجانب الخارجي للساق',
    function: 'يساعد في دعم الكاحل وارتكاز العضلات.',
    description: 'العظم الأنحف الموازي للظنبوب.',
    issues: [
      issueFracture,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'مفصل الكاحل',
    system: 'الجهاز الحركي',
    location: 'بين الساق والقدم',
    function: 'يسمح بحركة القدم ويساعد على التوازن.',
    description: 'مفصل تحيط به أربطة وأوتار.',
    issues: [
      issueSprain,
      issueJoint,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'عظام القدم',
    system: 'الهيكل العظمي',
    location: 'القدم',
    function: 'دعم الوزن والمشي والتوازن.',
    description: 'تضم عظام الرصغ ومشط القدم والسلاميات.',
    issues: [
      issueFracture,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الجلد',
    system: 'الجهاز اللحافي',
    location: 'يغطي الجسم',
    function: 'حاجز واقٍ ويساهم في تنظيم الحرارة والإحساس.',
    description: 'أكبر عضو من حيث المساحة، ويتكون من طبقات.',
    issues: [
      issueSkin,
      issueInflammation,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'العضلات الهيكلية',
    system: 'الجهاز العضلي',
    location: 'مختلف أنحاء الجسم',
    function: 'الحركة الإرادية ودعم المفاصل والمساعدة في الوضعية.',
    description: 'عضلات ترتبط بالعظام بواسطة الأوتار.',
    issues: [
      issueMuscle,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الأوتار',
    system: 'الجهاز الحركي',
    location: 'بين العضلات والعظام',
    function: 'نقل قوة العضلات إلى العظام.',
    description: 'أنسجة ضامة قوية تنقل القوة أثناء الحركة.',
    issues: [
      issueSprain,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الأربطة',
    system: 'الجهاز الحركي',
    location: 'حول المفاصل',
    function: 'ربط العظام والمساهمة في ثبات المفصل.',
    description: 'أشرطة من نسيج ضام تساعد على استقرار المفاصل.',
    issues: [
      issueSprain,
      issueJoint,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الأعصاب الطرفية',
    system: 'الجهاز العصبي',
    location: 'مختلف أنحاء الجسم',
    function: 'نقل الإشارات الحسية والحركية بين الجهاز العصبي والأنسجة.',
    description: 'شبكة أعصاب خارج الدماغ والحبل الشوكي.',
    issues: [
      issueNumbness,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الأوعية الدموية',
    system: 'الجهاز الدوري',
    location: 'مختلف أنحاء الجسم',
    function: 'نقل الدم والأكسجين والمغذيات والفضلات.',
    description: 'تشمل الشرايين والأوردة والشعيرات الدموية.',
    issues: [
      issuePain,
      issueBreathing,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الدم',
    system: 'الجهاز الدوري',
    location: 'داخل القلب والأوعية',
    function: 'نقل الغازات والمغذيات والخلايا المناعية ومواد أخرى.',
    description: 'نسيج سائل يتكون من البلازما وخلايا وعناصر أخرى.',
    issues: [
      issueFever,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الطحال',
    system: 'الجهاز اللمفاوي والمناعة',
    location: 'أعلى يسار البطن',
    function: 'المساهمة في المناعة وتنقية الدم من بعض الخلايا القديمة.',
    description: 'عضو لمفاوي يقع قرب المعدة.',
    issues: [
      issueStomach,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الغدد اللمفاوية',
    system: 'الجهاز اللمفاوي',
    location: 'مناطق متعددة',
    function: 'ترشيح اللمف والمساهمة في الاستجابة المناعية.',
    description: 'تجمعات صغيرة من النسيج المناعي.',
    issues: [
      issueInflammation,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الحجاب الحاجز',
    system: 'الجهاز التنفسي',
    location: 'أسفل القفص الصدري',
    function: 'العضلة الرئيسية للتنفس.',
    description: 'عضلة تفصل التجويف الصدري عن البطني.',
    issues: [
      issueBreathing,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الكتف',
    system: 'الجهاز الحركي',
    location: 'بين الذراع والجذع',
    function: 'إتاحة مدى واسع من حركة الذراع.',
    description: 'منطقة تضم عدة مفاصل وعضلات وأوتار.',
    issues: [
      issueJoint,
      issueSprain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'مفصل المرفق',
    system: 'الجهاز الحركي',
    location: 'بين العضد والساعد',
    function: 'ثني الذراع ومدها والمساعدة في تدوير الساعد.',
    description: 'مفصل تدعمه أربطة وعضلات.',
    issues: [
      issueJoint,
      issueSprain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'عظام الرسغ',
    system: 'الهيكل العظمي',
    location: 'بين الساعد واليد',
    function: 'ربط اليد بالساعد وتوفير الحركة.',
    description: 'مجموعة من العظام الصغيرة عند قاعدة اليد.',
    issues: [
      issueFracture,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'عظام اليد',
    system: 'الهيكل العظمي',
    location: 'اليد',
    function: 'الإمساك والحركة الدقيقة.',
    description: 'تشمل عظام الرسغ والمشط والسلاميات.',
    issues: [
      issueFracture,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الأصابع',
    system: 'الجهاز الحركي',
    location: 'اليدان والقدمان',
    function: 'المساعدة في الإمساك والتوازن والحركة الدقيقة.',
    description: 'تتكون الأصابع من سلاميات ومفاصل وأوتار وأعصاب.',
    issues: [
      issueSprain,
      issueFracture,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'العضلات الوربية',
    system: 'الجهاز العضلي',
    location: 'بين الأضلاع',
    function: 'المساعدة في حركة القفص الصدري أثناء التنفس.',
    description: 'طبقات عضلية تقع بين الأضلاع.',
    issues: [
      issueMuscle,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'القرنية',
    system: 'الجهاز البصري',
    location: 'مقدمة العين',
    function: 'تمرير الضوء والمساهمة في تركيزه.',
    description: 'طبقة شفافة حساسة في مقدمة العين.',
    issues: [
      issueEye,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الشبكية',
    system: 'الجهاز البصري',
    location: 'داخل العين',
    function: 'تحويل الضوء إلى إشارات عصبية.',
    description: 'نسيج حساس للضوء في الجزء الخلفي من العين.',
    issues: [
      issueEye,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الغدة النخامية',
    system: 'جهاز الغدد الصماء',
    location: 'قاعدة الدماغ',
    function: 'تنظيم هرمونات تؤثر في عدة غدد ووظائف.',
    description: 'غدة صغيرة ترتبط بتنظيم هرموني واسع.',
    issues: [
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الغدتان الكظريتان',
    system: 'جهاز الغدد الصماء',
    location: 'فوق الكليتين',
    function: 'إنتاج هرمونات منها الكورتيزول والألدوستيرون والأدرينالين.',
    description: 'غدتان صغيرتان تقعان فوق الكليتين.',
    issues: [
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'المريء',
    system: 'الجهاز الهضمي',
    location: 'بين الحلق والمعدة',
    function: 'نقل الطعام والسوائل إلى المعدة.',
    description: 'أنبوب عضلي يساعد على البلع.',
    issues: [
      issueDigestive,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'المستقيم',
    system: 'الجهاز الهضمي',
    location: 'نهاية الأمعاء الغليظة',
    function: 'تخزين البراز قبل الإخراج.',
    description: 'الجزء النهائي من الأمعاء الغليظة.',
    issues: [
      issueDigestive,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الحبل الصوتي',
    system: 'الجهاز التنفسي والصوتي',
    location: 'الحنجرة',
    function: 'إنتاج الصوت عند مرور الهواء.',
    description: 'طيات نسيجية تهتز لإنتاج الصوت.',
    issues: [
      issueInflammation,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الغدة اللعابية',
    system: 'الجهاز الهضمي',
    location: 'حول الفم والفك',
    function: 'إنتاج اللعاب لترطيب الفم والمساعدة في الهضم.',
    description: 'تشمل الغدد النكفية وتحت الفك وتحت اللسان.',
    issues: [
      issueInflammation,
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'القرص بين الفقرات',
    system: 'الجهاز الحركي',
    location: 'بين الفقرات',
    function: 'امتصاص الصدمات والمساعدة في حركة العمود الفقري.',
    description: 'بنية غضروفية ليفية بين أجسام الفقرات.',
    issues: [
      issueBack,
      issueNumbness,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'عضلة القلب',
    system: 'الجهاز العضلي والدوري',
    location: 'القلب',
    function: 'الانقباض لضخ الدم.',
    description: 'نسيج عضلي متخصص لا يعمل بإرادة واعية.',
    issues: [
      issueChestPain,
      issueBreathing,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'البروستاتا',
    system: 'الجهاز التناسلي الذكري',
    location: 'أسفل المثانة',
    function: 'المساهمة في إنتاج السائل المنوي.',
    description: 'غدة تحيط بجزء من الإحليل لدى الذكور.',
    issues: [
      issueUrinary,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الرحم',
    system: 'الجهاز التناسلي الأنثوي',
    location: 'الحوض',
    function: 'احتضان الحمل ونمو الجنين.',
    description: 'عضو عضلي في الجهاز التناسلي الأنثوي.',
    issues: [
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'المبيض',
    system: 'الجهاز التناسلي الأنثوي',
    location: 'الحوض',
    function: 'إنتاج البويضات وبعض الهرمونات.',
    description: 'غدة تناسلية أنثوية مزدوجة.',
    issues: [
      issuePain,
      issueGeneral,
    ],
  ),
  BodyPart(
    name: 'الخصية',
    system: 'الجهاز التناسلي الذكري',
    location: 'كيس الصفن',
    function: 'إنتاج الحيوانات المنوية والتستوستيرون.',
    description: 'غدة تناسلية ذكرية.',
    issues: [
      issuePain,
      issueGeneral,
    ],
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tab = 0;
  String _query = '';
  String _system = 'الكل';

  final systems = const [
    'الكل',
    'الهيكل العظمي',
    'الجهاز العصبي',
    'الجهاز الدوري',
    'الجهاز التنفسي',
    'الجهاز الهضمي',
    'الجهاز الحركي',
    'الجهاز البولي',
    'الجهاز اللحافي',
    'جهاز الغدد الصماء',
  ];

  List<BodyPart> get filteredParts {
    return bodyParts.where((part) {
      final matchesQuery = _query.trim().isEmpty ||
          part.name.contains(_query.trim()) ||
          part.system.contains(_query.trim()) ||
          part.location.contains(_query.trim());
      final matchesSystem = _system == 'الكل' ||
          part.system.contains(_system) ||
          (_system == 'الجهاز اللحافي' && part.system == 'الجهاز اللحافي');
      return matchesQuery && matchesSystem;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildExplore(),
      _buildLibrary(),
      _buildSafety(),
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFF168C83),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.favorite, color: Colors.white),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('نبض', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 21)),
                  Text('موسوعة الإنسان الصحية', style: TextStyle(fontSize: 11, color: Colors.black54)),
                ],
              ),
            ],
          ),
        ),
        body: SafeArea(child: pages[_tab]),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _tab,
          onDestinationSelected: (v) => setState(() => _tab = v),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.accessibility_new), label: 'استكشف الجسم'),
            NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'الموسوعة'),
            NavigationDestination(icon: Icon(Icons.health_and_safety_outlined), label: 'السلامة'),
          ],
        ),
      ),
    );
  }

  Widget _buildExplore() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF167D75), Color(0xFF25A99B)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('افهم جسمك، خطوة بخطوة', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('تعرّف على الأعضاء ووظائفها والمشكلات الصحية الشائعة بلغة مبسطة.', style: TextStyle(color: Colors.white, height: 1.5)),
              SizedBox(height: 12),
              Row(children: [
                Icon(Icons.offline_bolt, color: Colors.white),
                SizedBox(width: 6),
                Text('المحتوى الحالي متاح دون إنترنت', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              ]),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const Text('اختر منطقة من الجسم', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        _bodyMap(),
        const SizedBox(height: 18),
        const Text('تصفّح حسب الجهاز', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: systems.map((s) => ChoiceChip(
            label: Text(s),
            selected: _system == s,
            onSelected: (_) => setState(() {
              _system = s;
              _tab = 1;
            }),
          )).toList(),
        ),
        const SizedBox(height: 18),
        _noticeCard(
          icon: Icons.info_outline,
          title: 'تنبيه طبي',
          text: 'هذا التطبيق للتثقيف الصحي ولا يشخّص الأمراض. في حالات الطوارئ لا تنتظر إرشادات التطبيق.',
        ),
      ],
    );
  }

  Widget _bodyMap() {
    final regions = [
      ('الرأس والدماغ', Icons.psychology_alt, 'الرأس'),
      ('الصدر والقلب', Icons.favorite_border, 'الصدر'),
      ('البطن والأعضاء الداخلية', Icons.airline_seat_flat, 'البطن'),
      ('الظهر والعمود الفقري', Icons.accessibility_new, 'الظهر'),
      ('الذراعان واليدان', Icons.back_hand_outlined, 'اليد'),
      ('الساقان والقدمان', Icons.directions_walk, 'القدم'),
    ];
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFE7F4F2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const Icon(Icons.accessibility_new, size: 100, color: Color(0xFF168C83)),
              const Text('خريطة تشريحية مبسطة', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('اختر منطقة لعرض البنى المسجلة فيها', style: TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: regions.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 2.6,
          ),
          itemBuilder: (context, index) {
            final item = regions[index];
            return Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () {
                  setState(() {
                    _query = item.$3;
                    _tab = 1;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(item.$2, color: const Color(0xFF168C83), size: 22),
                      const SizedBox(width: 8),
                      Expanded(child: Text(item.$1, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildLibrary() {
    final parts = filteredParts;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('مكتبة التشريح والصحة', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text('${bodyParts.length} بنية تشريحية مضافة في هذه النسخة التجريبية', style: const TextStyle(color: Colors.black54)),
        const SizedBox(height: 14),
        TextField(
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            hintText: 'ابحث عن عضو أو منطقة أو جهاز...',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          ),
          onChanged: (v) => setState(() => _query = v),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: _system,
          decoration: InputDecoration(
            labelText: 'التصنيف',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          ),
          items: systems.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
          onChanged: (v) => setState(() => _system = v ?? 'الكل'),
        ),
        const SizedBox(height: 12),
        if (parts.isEmpty)
          const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: Text('لا توجد نتائج مطابقة. جرّب كلمة أخرى.')),
          ),
        ...parts.map((part) => Card(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFE3F4F1),
              child: Icon(_iconForSystem(part.system), color: const Color(0xFF168C83)),
            ),
            title: Text(part.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${part.system} • ${part.location}'),
            trailing: const Icon(Icons.chevron_left),
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => PartDetailPage(part: part),
            )),
          ),
        )),
      ],
    );
  }

  Widget _buildSafety() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('السلامة أولًا', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('إرشادات عامة لاستخدام التطبيق بطريقة آمنة.', style: TextStyle(color: Colors.black54)),
        const SizedBox(height: 14),
        _noticeCard(
          icon: Icons.emergency,
          title: 'متى تطلب المساعدة العاجلة؟',
          text: 'ألم الصدر الجديد أو الشديد، وصعوبة التنفس الشديدة، وفقدان الوعي، وعلامات السكتة الدماغية، والنزف الشديد، ورد الفعل التحسسي الشديد تستدعي طلب الطوارئ فورًا.',
          warning: true,
        ),
        _noticeCard(
          icon: Icons.medication_outlined,
          title: 'لا تتناول دواءً بناءً على التخمين',
          text: 'الأدوية قد تتفاعل مع بعضها، وقد لا تناسب الحمل أو أمراض الكلى والكبد أو بعض الأعمار. اسأل طبيبًا أو صيدليًا قبل بدء علاج جديد.',
        ),
        _noticeCard(
          icon: Icons.fact_check_outlined,
          title: 'المعلومات ليست تشخيصًا',
          text: 'قد تتشابه أعراض أمراض مختلفة. لا يستطيع التطبيق إجراء فحص بدني أو تحاليل أو تصوير طبي.',
        ),
        _noticeCard(
          icon: Icons.child_care_outlined,
          title: 'الأطفال والحمل والأمراض المزمنة',
          text: 'تحتاج هذه الحالات إلى إرشادات خاصة. لا تطبق نصائح البالغين العامة على الأطفال أو الحوامل دون استشارة مختص.',
        ),
        _noticeCard(
          icon: Icons.update,
          title: 'مراجعة المحتوى',
          text: 'هذه نسخة أولية. قبل نشر التطبيق يجب مراجعة صفحات الأمراض والأدوية بواسطة مختصين وإضافة مراجع طبية موثوقة وتاريخ آخر تحديث.',
        ),
      ],
    );
  }

  Widget _noticeCard({
    required IconData icon,
    required String title,
    required String text,
    bool warning = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: warning ? Colors.red.shade700 : const Color(0xFF168C83), size: 26),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 6),
                  Text(text, style: const TextStyle(height: 1.5)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PartDetailPage extends StatelessWidget {
  final BodyPart part;
  const PartDetailPage({super.key, required this.part});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text(part.name)),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFE5F4F1),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.biotech_outlined, size: 38, color: Color(0xFF168C83)),
                  const SizedBox(height: 8),
                  Text(part.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('${part.system} • ${part.location}', style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _section('ما هي؟', part.description, Icons.info_outline),
            _section('وظيفتها', part.function, Icons.settings_accessibility),
            const SizedBox(height: 8),
            const Text('المشكلات الصحية ذات الصلة', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...part.issues.map((issue) => Card(
              child: ExpansionTile(
                leading: const Icon(Icons.health_and_safety_outlined, color: Color(0xFF168C83)),
                title: Text(issue.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(issue.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  _issueField('الأعراض المحتملة', issue.symptoms),
                  _issueField('ما الذي يمكن فعله مبدئيًا؟', issue.care),
                  _issueField('العلاج', issue.treatment),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0ED),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('علامات تستدعي الانتباه', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9B2C20))),
                        const SizedBox(height: 4),
                        Text(issue.urgency),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(issue.sourceNote, style: const TextStyle(fontSize: 11, color: Colors.black54)),
                  const SizedBox(height: 6),
                  const Text(commonWarning, style: TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            )),
            const SizedBox(height: 12),
            const Text(
              'تنبيه: هذه النسخة نموذج تعليمي أولي. لا تعتمد عليها لتشخيص مرض أو اختيار دواء. عند وجود أعراض خطيرة اطلب المساعدة الطبية.',
              style: TextStyle(color: Colors.redAccent, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _section(String title, String body, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFF168C83)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(body, style: const TextStyle(height: 1.5)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _issueField(String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(body, style: const TextStyle(height: 1.5)),
        ],
      ),
    );
  }
}

IconData _iconForSystem(String system) {
  if (system.contains('عظمي')) return Icons.accessibility_new;
  if (system.contains('عصبي')) return Icons.psychology_alt;
  if (system.contains('دوري')) return Icons.favorite_border;
  if (system.contains('تنفسي')) return Icons.air;
  if (system.contains('هضمي')) return Icons.restaurant;
  if (system.contains('بولي')) return Icons.water_drop_outlined;
  if (system.contains('غدد')) return Icons.biotech_outlined;
  if (system.contains('عضلي') || system.contains('حركي')) return Icons.fitness_center;
  return Icons.health_and_safety_outlined;
}
