<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SupportTicket extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'ticket_no',
        'support_taken_by',
        'subject',
        'message',
        'attachment',
        'status',
        'slug',
    ];

    /**
     * Get the user that is handling the support ticket.
     */
    public function supportAgent()
    {
        return $this->belongsTo(User::class, 'support_taken_by');
    }

    /**
     * Get the status label.
     *
     * @return string
     */
    public function getStatusLabelAttribute()
    {
        $statuses = [
            0 => 'Pending',
            1 => 'In Progress',
            2 => 'Solved',
            3 => 'Rejected',
            4 => 'On Hold',
        ];

        return $statuses[$this->status] ?? 'Unknown';
    }

    /**
     * Get the status badge class.
     *
     * @return string
     */
    public function getStatusBadgeAttribute()
    {
        $badges = [
            0 => 'badge-warning',
            1 => 'badge-info',
            2 => 'badge-success',
            3 => 'badge-danger',
            4 => 'badge-secondary',
        ];

        return $badges[$this->status] ?? 'badge-light';
    }

    public function messages()
    {
        return $this->hasMany(SupportMessage::class);
    }
}
