DELIMITER $$

CREATE PROCEDURE insert_data()
BEGIN
    DECLARE count INT DEFAULT 1;
    DECLARE GEN FLOAT;
	DECLARE ASK_HEIGHT FLOAT;
    DECLARE ASK_AGE float;
    
    WHILE count <= 100 DO
        SET GEN = RAND();
		SET ASK_HEIGHT = RAND();
        SET ASK_AGE  =  RAND();
        IF GEN > 0.5 THEN
            INSERT INTO matched_table(id, gender, height, age, ask_gender, ask_height_up, ask_height_low, ask_age_up, ask_age_low)
            VALUES (
                count, 'MAN', ROUND(RAND() * 10) + 160 + ROUND(GEN),
                ROUND(RAND() * 10) + 15, IF(RAND() > 0.2, 'woman', 'man'),
                ROUND(ASK_HEIGHT * 10) + 150 + ROUND(GEN * 1.5), ROUND(ASK_HEIGHT * 10) + 150,
                ROUND(ASK_AGE * 12) + 18 + 1, ROUND(ASK_AGE * 8) + 18
            );
        ELSE
            INSERT INTO matched_table(id, gender, height, age, ask_gender, ask_height_up, ask_height_low, ask_age_up, ask_age_low)
            VALUES (
                count, 'WOMAN', ROUND(RAND() * 10) + 150 + ROUND(GEN),
                ROUND(RAND() * 10) + 15, IF(RAND() > 0.2, 'man', 'woman'),
                ROUND(ASK_HEIGHT * 10) + 170 + round(GEN)  , ROUND(ASK_HEIGHT * 10) + 160,
                ROUND(ASK_AGE * 15) + 15, ROUND(ASK_AGE* 8) + 15
            );
        END IF;

        SET count = count + 1;
    END WHILE;
END $$

DELIMITER ;

CALL insert_data();