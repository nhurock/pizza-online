package de.stea1th.commonlibrary.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;


@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
public class ProductDto extends AbstractBaseDto {

    private String name;

    private String description;

    private BigDecimal price;

    private Integer discount;

    private String picture;
}
