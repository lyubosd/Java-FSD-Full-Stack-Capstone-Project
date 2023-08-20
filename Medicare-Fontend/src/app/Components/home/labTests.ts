export interface LabTests {
    name: string;
    url: string;
    description?: string;
    title?: string;
}


export const labTests: LabTests[] = [
    {
        name: 'Vitamin D',
        url: 'vitaminDtest.jpg',
        description: 'A vitamin D blood test measures the level of 25 (OH)D in your blood. The test can determine if your vitamin D levels are too high or too low. The test is used to screen for or monitor bone disorders. Results of the 25-hydroxyvitamin D test fall in the following ranges4: Less than 12 ng/mL is considered deficient. Between 12 and 20 ng/mL is considered insufficient or a potential deficiency. Anything from 20 ng/mL to 50ng/mL is considered normal. Over 50 ng/mL is considered high. Over 200 ng/mL is considered toxic.'
    },
    {
        name: 'Diabetes',
        url: 'diabetesTest.jpg',
        description:'Diabetes, also known as diabetes mellitus, is a disease that affects how your body uses glucose (blood sugar). Glucose is your bodys main source of energy. A hormone called insulin helps move glucose from your bloodstream into your cells. If you have diabetes, your body can not make insulin or insulin does not work like it should. This can cause glucose levels to get too high, which can lead to serious health problems. These include heart disease, nerve damage, eye problems, and kidney disease. Diabetes tests measure glucose levels in blood or urine to see if you are at risk for or have diabetes.'

    },
    {
        name: 'Iron Deficiency',
        url: 'ironDeficiencyTest.jpg',
        description: 'To diagnose iron deficiency anemia, your should run tests to look for: Red blood cell size and color. With iron deficiency anemia, red blood cells are smaller and paler in color than normal. Hematocrit. This is the percentage of your blood volume made up by red blood cells.'

    },
    {
        name: 'Testosterone',
        url: 'testosteroneTest.png',
        description: 'A testosterone test is a blood test that measures the levels of testosterone in your blood. Most of the testosterone in the blood is attached to proteins, but there is also free testosterone. The test can help find the reason for sexual problems in males, like reduced sex drive or erectile dysfunction. If you’re having a hard time getting your partner pregnant, the test can tell if your blood testosterone level is low.'

    },
    {
        name: 'Covid-19 PCR Test',
        url: 'covidTest.jpg',
        description: 'COVID-19 testing involves analyzing samples to assess the current or past presence of SARS-CoV-2. The two main types of tests detect either the presence of the virus or antibodies produced in response to infection. Molecular tests for viral presence through its molecular components are used to diagnose individual cases and to allow public health authorities to trace and contain outbreaks. Antibody tests (serology immunoassays) instead show whether someone once had the disease. They are less useful for diagnosing current infections because antibodies may not develop for weeks after infection. It is used to assess disease prevalence, which aids the estimation of the infection fatality rate.'

    },
    {
        name: 'Lipid Profile',
        url: 'lipidProfile.jpg',
        description: 'A lipid profile is a combination of blood tests performed to check the cholesterol levels and the level of triglycerides in the blood. Lipids are fats that cannot dissolve in blood, and unhealthy levels of lipids can clog your arteries and increase your risk of heart disease and stroke. A lipid profile includes tests for total cholesterol, HDL cholesterol, LDL cholesterol, and triglycerides.'

    },
    {
        name: 'Thyroid Profile',
        url: 'thyroidProfile.jpg',
        description: 'Thyroid Profile tests are a series of blood tests used to measure how well your thyroid gland is working. Available tests include T3, T3RU, T4, and TSH. The thyroid gland processes hormones that regulate your body’s metabolism (weight, temperature, energy).'

    },
    {
        name: 'Kidney Function Test',
        url: 'kidneyFunctionTest.jpg',
        description: 'Kidney function tests measure how efficiently your kidneys are working. Most of these tests check how well your kidneys clear waste from your system. A kidney test may involve a blood test, 24-hour urine sample or both. You usually have your test results the same day or within a few days.Kidney function tests are urine or blood tests that evaluate how well your kidneys are working. Most of these tests measure glomerular filtration rate (GFR). GFR assesses how efficiently your kidneys clear waste from your system.'

    }
];