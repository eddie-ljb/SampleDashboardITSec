import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { NgxGoogleAnalyticsModule } from '@hakimio/ngx-google-analytics';
import { GoogleTagManagerService } from 'angular-google-tag-manager';

@Component({
    selector: 'app-root',
    standalone: true,
    imports: [RouterModule, NgxGoogleAnalyticsModule],
    template: `
        <router-outlet></router-outlet>`
})
export class AppComponent {

    constructor(
    private gtmService: GoogleTagManagerService,
) { this.customEvent(); }

    customEvent() {
        // push GTM data layer with a custom event
        const gtmTag = {
            event: 'button-click',
            data: 'my-custom-event',
        };
        this.gtmService.pushTag(gtmTag);
        alert('this is a custom event');
    }

}
