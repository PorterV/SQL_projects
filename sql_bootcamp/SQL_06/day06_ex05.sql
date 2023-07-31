COMMENT ON TABLE person_discounts IS 'Персональная скидка клиенту от ресторана ';
COMMENT ON COLUMN person_discounts.id IS 'ID скидки ';
COMMENT ON COLUMN person_discounts.person_id IS 'ID клиента';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID ресторана';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки';