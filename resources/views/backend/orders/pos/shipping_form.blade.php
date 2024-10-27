<div class="table-responsive">
    <table class="table mb-0">
        <tbody>
            <tr>
                <th style="width: 30%; line-height: 36px;">Full Name<span class="text-danger">*</span></th>
                <td>
                    <input type="text" name="shipping_name" id="shipping_name" class="form-control" placeholder="Full Name" required>
                </td>
            </tr>
            <tr>
                <th style="width: 30%; line-height: 36px;">Customer Email<span class="text-danger">*</span></th>
                <td>
                    <input type="email" name="shipping_email" id="shipping_email" class="form-control" placeholder="Email" required>
                </td>
            </tr>
            <tr>
                <th style="width: 30%; line-height: 36px;">Customer Phone<span class="text-danger">*</span></th>
                <td>
                    <input type="text" name="shipping_phone" id="shipping_phone" class="form-control" placeholder="Phone No" required>
                </td>
            </tr>
            <tr>
                <th style="width: 30%; line-height: 36px;">Customer Address</th>
                <td>
                    <input type="text" name="shipping_address" id="shipping_address" class="form-control" placeholder="Street No/House No/Area">
                </td>
            </tr>
            <tr>
                <th style="width: 30%; line-height: 36px;">Shipping City</th>
                <td>
                    <select class="form-control" name="shipping_district_id" id="shipping_district_id" data-toggle="select2" required>
                        <option value="">Select One</option>
                        @foreach($districts as $district)
                        <option value="{{$district->id}}">{{$district->name}}</option>
                        @endforeach
                    </select>
                </td>
            </tr>
            <tr>
                <th style="width: 30%; line-height: 36px;">Sub-District/State</th>
                <td>
                    <select name="shipping_thana_id" data-toggle="select2" id="shipping_thana_id" required>
                        <option value="">Select One</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th style="width: 30%; line-height: 36px;">Post Code</th>
                <td>
                    <input type="text" name="shipping_postal_code" id="shipping_postal_code" class="form-control" placeholder="Post Code">
                </td>
            </tr>
        </tbody>
    </table>
</div>
