Hello!

Check a Lib folder for implementation of a Translator

example of usages in web/main.dart

Привіт
Привіт user!
10 днів
1 день
3 дні

Привет
Привет user!
10 дней
1 день
3 дня
        
        Compare structure of vocabularies:

        // by intuitive designation and expectation not big amount of translation
        // we can choose flat list

        // Flat List.
        // O(n) where n is all our translation, all langs and keys variation
        // Any search require iterate all collection with check for lang and key
        [
            { "lang": "ru", "key": "hello %s", "translation": "Privet s%!" },
            ...
        ]

        // Nested struct. ( group by lang )
        [
            {
                "ru" : [
                    {  "key": "hello %s", "translation": "Privet s%!" },
                    ...
                ]
            }
        ]

        // Nested struct. ( group by key )
        [
            {
                "hello %s" : [
                    {  "lang": "ru", "translation": "Privet s%!" },
                    ...
                ]
            }
        ]

        // Nested struct ( group by key and lang )
        {
            "hello %s" : {
                "ru": { "translation": "Privet s%!" },
                "ua": { "translation": "Vitayu s%!" },
                ...
            }
        }