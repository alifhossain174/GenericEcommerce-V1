<tr>
    <td class="text-center">
        <input type="file" class="form-control" name="product_variant_image[]">
    </td>
    <td class="text-center">
        <select name="product_variant_color_id[]" data-toggle="select2" class="form-control">
            @php
                echo App\Models\Color::getDropDownList('name');
            @endphp
        </select>
    </td>
    <td class="text-center">
        <select name="product_variant_region_id[]" data-toggle="select2" class="form-control">
            @php
                echo App\Models\Region::getDropDownList('name');
            @endphp
        </select>
    </td>
    <td class="text-center">
        <select name="product_variant_sim_id[]" data-toggle="select2" class="form-control">
            @php
                echo App\Models\Sim::getDropDownList('name');
            @endphp
        </select>
    </td>
    <td class="text-center">
        <select name="product_variant_storage_type_id[]" data-toggle="select2" class="form-control">
            @php
                echo App\Models\StorageType::getDropDownList('ram');
            @endphp
        </select>
    </td>
    <td class="text-center">
        <input type="number" class="form-control" name="product_variant_stock[]" value="0" style="height: 34px;" placeholder="0">
    </td>
    <td class="text-center">
        <input type="number" class="form-control" name="product_variant_price[]" value="0" style="height: 34px;" placeholder="0">
    </td>
    <td class="text-center">
        <input type="number" class="form-control" name="product_variant_discounted_price[]" value="0" style="height: 34px;" placeholder="0">
    </td>
    <td class="text-center">
        <select name="product_variant_warrenty[]" data-toggle="select2" class="form-control">
            @php
                echo App\Models\ProductWarrenty::getDropDownList('name');
            @endphp
        </select>
    </td>
    <td class="text-center">
        <select name="product_variant_device_condition_id[]" data-toggle="select2" class="form-control">
            @php
                echo App\Models\DeviceCondition::getDropDownList('name');
            @endphp
        </select>
    </td>
    <td class="text-center">
        <a href="javascript:void(0)" onclick="removeRow(this)" class="btn btn-danger rounded btn-sm d-inline text-white"><i class="feather-trash-2" style="font-size: 14px; line-height: 2"></i></a>
    </td>
</tr>

