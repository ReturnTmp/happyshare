package cn.returntmp.happyshare.dto;


import lombok.Data;

/**
 * @author ronger
 */
@Data
public class ChangeEmailDTO {

    private Long idUser;

    private String email;

    private String code;

}
