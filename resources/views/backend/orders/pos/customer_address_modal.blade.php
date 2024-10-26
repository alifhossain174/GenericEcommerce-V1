<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form>
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    Add Address
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-left">

                <div class="form-group">
                    <label for="simpleinput">Full Name</label>
                    <input type="text" id="simpleinput" class="form-control" placeholder="Full Name" />
                </div>

                <div class="form-group">
                    <label for="simpleinput">Phone Number</label>
                    <input type="tel" id="simpleinput" class="form-control" placeholder="Phone Number" />
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail1">Email Address
                    </label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                        placeholder="Email Address" />
                </div>

                <div class="form-group">
                    <label for="simpleinput">Address</label>
                    <input type="text" id="simpleinput" class="form-control" placeholder="Address" />
                </div>

                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="simpleinput">City</label>
                            <select class="form-control w-100" data-toggle="select2">
                                <option>Select</option>
                                <option value="AL">Alabama</option>
                                <option value="AR">Arkansas</option>
                                <option value="IL">Illinois</option>
                                <option value="IA">Iowa</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="simpleinput">Sub-District/State</label>
                            <select class="form-control w-100" data-toggle="select2">
                                <option>Select</option>
                                <option value="AL">Alabama</option>
                                <option value="AR">Arkansas</option>
                                <option value="IL">Illinois</option>
                                <option value="IA">Iowa</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label>Set address for</label>
                    <div class="set-address">
                        <div class="single-set-address">
                            <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off" />
                            <label class="btn btn-outline-primary" for="btncheck1">Shipping address</label>
                        </div>
                        <div class="single-set-address">
                            <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off" />
                            <label class="btn btn-outline-primary" for="btncheck2">Billing address</label>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                    Close
                </button>
                <button type="button" class="btn btn-primary">
                    Save
                </button>
            </div>
            </form>
        </div>
    </div>
</div>
