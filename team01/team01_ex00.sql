WITH c AS
  (SELECT DISTINCT ON (id) *
   FROM public.currency
   ORDER BY id,
            updated DESC)
SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       b.type,
       SUM(b.money) AS volume,
       COALESCE(MIN(c.name), 'not defined') AS currency_name,
       COALESCE(MIN(c.rate_to_usd), 1) AS last_rate_to_usd,
       COALESCE(MIN(c.rate_to_usd), 1) * SUM(b.money) AS total_volume_in_usd
FROM public.user u
FULL OUTER JOIN public.balance b ON u.id = b.user_id
FULL OUTER JOIN c ON b.currency_id = c.id
GROUP BY u.id,
         b.type
ORDER BY name DESC,
         lastname ASC,
         b.type ASC;

