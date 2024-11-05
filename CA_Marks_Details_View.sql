CREATE VIEW CA_Marks_Details AS
SELECT 
    m.Reg_no,
    m.Course_Code,

    CASE WHEN s.Status = 'Suspended' THEN 'WH' ELSE m.Quiz_01 END AS Quiz_01,
    CASE WHEN s.Status = 'Suspended' THEN 'WH' ELSE m.Quiz_02 END AS Quiz_02,
    CASE WHEN s.Status = 'Suspended' THEN 'WH' ELSE m.Quiz_03 END AS Quiz_03,

    CASE WHEN s.Status = 'Suspended' THEN 'WH' ELSE m.Mid_theory END AS Mid_theory,
    CASE WHEN s.Status = 'Suspended' THEN 'WH' ELSE m.Mid_Practical END AS Mid_Practical,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        ELSE ROUND((GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) + 
            (
                CASE 
                    WHEN m.Quiz_01 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                        GREATEST(m.Quiz_02, m.Quiz_03)
                    WHEN m.Quiz_02 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                        GREATEST(m.Quiz_01, m.Quiz_03)
                    ELSE 
                        GREATEST(m.Quiz_01, m.Quiz_02)
                END
            )) / 2.0, 0)
    END AS Top_Two_Quiz_Score,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        ELSE CASE 
            WHEN m.Mid_theory > 0 AND m.Mid_Practical > 0 THEN 
                m.Mid_theory + m.Mid_Practical
            WHEN m.Mid_theory > 0 THEN 
                m.Mid_theory * 2
            WHEN m.Mid_Practical > 0 THEN 
                m.Mid_Practical * 2
            ELSE 0
        END 
    END AS Midterm_Score,

    CASE WHEN s.Status = 'Suspended' THEN 'WH' ELSE m.Assignment END AS Assignment_Score,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        ELSE (ROUND((GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) + 
            (
                CASE 
                    WHEN m.Quiz_01 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                        GREATEST(m.Quiz_02, m.Quiz_03)
                    WHEN m.Quiz_02 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                        GREATEST(m.Quiz_01, m.Quiz_03)
                    ELSE 
                        GREATEST(m.Quiz_01, m.Quiz_02)
                END
            )) / 2.0, 0) + 
        CASE 
            WHEN m.Mid_theory > 0 AND m.Mid_Practical > 0 THEN 
                m.Mid_theory + m.Mid_Practical
            WHEN m.Mid_theory > 0 THEN 
                m.Mid_theory * 2
            WHEN m.Mid_Practical > 0 THEN 
                m.Mid_Practical * 2
            ELSE 0
        END + 
        m.Assignment)
    END AS Total_CA_Marks_400,

    CASE 
        WHEN s.Status = 'Suspended' THEN 'WH'
        ELSE ROUND(((ROUND((GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) + 
            (
                CASE 
                    WHEN m.Quiz_01 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                        GREATEST(m.Quiz_02, m.Quiz_03)
                    WHEN m.Quiz_02 = GREATEST(m.Quiz_01, m.Quiz_02, m.Quiz_03) THEN 
                        GREATEST(m.Quiz_01, m.Quiz_03)
                    ELSE 
                        GREATEST(m.Quiz_01, m.Quiz_02)
                END
            )) / 2.0, 0) + 
        CASE 
            WHEN m.Mid_theory > 0 AND m.Mid_Practical > 0 THEN 
                m.Mid_theory + m.Mid_Practical
            WHEN m.Mid_theory > 0 THEN 
                m.Mid_theory * 2
            WHEN m.Mid_Practical > 0 THEN 
                m.Mid_Practical * 2
            ELSE 0
        END + 
        m.Assignment) / 4.0), 0)
    END AS Final_CA_Marks_100