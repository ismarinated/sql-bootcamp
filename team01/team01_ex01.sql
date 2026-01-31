/*
INSERT INTO currency
VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');


INSERT INTO currency
VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');
*/

WITH c AS
  (SELECT DISTINCT ON (id) *
   FROM public.currency
   ORDER BY id,
            updated DESC)
SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       COALESCE(c.name, 'not defined') AS currency_name,
       b.money * COALESCE(
                            (SELECT rate_to_usd
                             FROM public.currency c
                             WHERE b.currency_id = c.id
                               AND c.updated < b.updated
                             ORDER BY c.updated DESC
                             LIMIT 1),
                            (SELECT rate_to_usd
                             FROM public.currency c
                             WHERE b.currency_id = c.id
                               AND c.updated > b.updated
                             ORDER BY c.updated ASC
                             LIMIT 1)) AS currency_in_usd
FROM public.balance b
LEFT JOIN public.user u ON b.user_id = u.id
INNER JOIN c ON b.currency_id = c.id
ORDER BY name DESC,
         lastname ASC,
         c.name ASC;

