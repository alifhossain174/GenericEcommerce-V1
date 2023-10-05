@extends('layouts.app')

@section('content')

    <div class="row">
        <div class="col-lg-5 d-none d-lg-block bg-login rounded-left"></div>
        <div class="col-lg-7">
            <div class="p-5">
                <div class="text-center">
                    <a href="{{url('/login')}}" class="d-block mb-5">
                        {{-- <img src="{{url('assets')}}/images/logo-dark.png" alt="app-logo" height="18" /> --}}
                        @php
                            $generalInfo = DB::table('general_infos')->where('id', 1)->select('company_name')->first();
                        @endphp
                       <h3>{{$generalInfo->company_name}} Admin Panel</h3>
                    </a>
                </div>
                <h1 class="h5 mb-1">Welcome Back!</h1>
                <p class="text-muted mb-4">Enter your email address and password to access admin panel.</p>
                <form class="user" method="POST" action="{{ route('login') }}" style="padding-bottom: 20px;">
                    @csrf
                    <div class="form-group">
                        <input type="email" value="admin@gmail.com" name="email" class="form-control form-control-user @error('email') is-invalid @enderror" id="exampleInputEmail email" value="{{ old('email') }}" required autocomplete="email" autofocus placeholder="Email Address">
                        @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <input type="password" value="12345678" name="password" class="form-control form-control-user @error('password') is-invalid @enderror" id="exampleInputPassword password" required autocomplete="current-password" placeholder="Password">
                        @error('password')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <button type="submit" class="btn btn-success btn-block">{{ __('Login') }}</button>
                </form>

            </div>
        </div>
    </div>
@endsection

