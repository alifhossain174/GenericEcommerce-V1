<?php

namespace App\Http\Controllers;

use App\Models\Footer;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Support\Str;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class FooterController extends Controller
{
    public function widgetView()
    {
        $footer = Footer::where('id', 1)->first();
        return view('backend.footer.config', compact('footer'));
    }

    public function saveFooter(Request $request)
    {
        $footer = Footer::first() ?? new Footer();

        $footer->widget1_title = $request->widget1_title;
        $footer->widget1_links = json_encode(array_map(function ($label, $url) {
            return [
                'widget1_link_label' => $label,
                'widget1_url' => $url,
            ];
        }, $request->widget1_link_label ?? [], $request->widget1_url ?? []));

        $footer->widget2_title = $request->widget2_title;
        $footer->widget2_links = json_encode(array_map(function ($label, $url) {
            return [
                'widget2_link_label' => $label,
                'widget2_url' => $url,
            ];
        }, $request->widget2_link_label ?? [], $request->widget2_url ?? []));

        $footer->widget3_links = json_encode(array_map(function ($label, $url) {
            return [
                'widget3_link_label' => $label,
                'widget3_url' => $url,
            ];
        }, $request->widget3_link_label ?? [], $request->widget3_url ?? []));

        $footer->social_link_title = $request->social_link_title;
        
        foreach ($request->social_link_label ?? [] as $index => $label) {
            $icon = isset($request->social_link_icon[$index]) ? $request->social_link_icon[$index] : null;
            $url = isset($request->social_link_url[$index]) ? $request->social_link_url[$index] : '';

            $existingSocialLinks = is_string($footer->social_links)
                ? json_decode($footer->social_links, true)
                : $footer->social_links ?? [];
            $oldIconPath = isset($existingSocialLinks[$index]) ? $existingSocialLinks[$index]['social_link_icon'] : null;

            $iconPath = $oldIconPath;

            if ($icon && $icon instanceof \Illuminate\Http\UploadedFile) {
                if ($oldIconPath && Storage::disk('public')->exists($oldIconPath)) {
                    Storage::disk('public')->delete($oldIconPath);
                }

                $iconPath = $icon->store('social-icons', 'public');
            }

            $socialLinks[] = [
                'social_link_label' => $label,
                'social_link_icon' => $iconPath,
                'social_link_url' => $url
            ];
        }

        $footer->social_links = json_encode($socialLinks ?? []);

        $footer->save();

        Toastr::success('Footer updated successfully');
        return redirect()->back();
    }

    public function deleteSocialLink($index)
    {
        $socialLinks = json_decode($this->footer->social_links, true);

        if (isset($socialLinks[$index]['social_link_icon'])) {
            $iconPath = $socialLinks[$index]['social_link_icon'];
            if (Storage::disk('public')->exists($iconPath)) {
                Storage::disk('public')->delete($iconPath);
            }
        }
        
        unset($socialLinks[$index]);

        $this->footer->social_links = json_encode(array_values($socialLinks));
        $this->footer->save();
    }
}
